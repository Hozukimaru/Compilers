grammar Src2;

@header {
    import java.util.*;
}

@members {
    static int addr_index = 0;
    static int gen_address() {
        return (addr_index ++);
    }
    static int label_index = 0;
    static int gen_label() {
        return (label_index ++);
    }

    // a class for bytecode instructions
    static void echo(String message) {
        System.out.println(message);
    }
    
    static String iload(int addr) {
        return "iload " + addr;
    }
    static String istore(int addr) {
        return "istore " + addr;
    }
    static String iadd() { return "iadd"; }
    static String isub() { return "isub"; }
    static String imul() {
        return "imul";
    }
    static String ldc(int x) {
        return "ldc " + x;
    }
    static String iflt(int l) { return "iflt LABEL_" + l; }
    static String ifeq(int l) { return "ifeq LABEL_" + l; }
    static String go(int l) {
        return "goto LABEL_" + l;
    }

    static String label(int l) {
        return "LABEL_" + l + ":";
    }

    static HashMap<String, Integer> symbolTable 
        = new HashMap<String, Integer>();


    // generated code fragments
    static class Code {
        List<String> block;
        int addr;
        public Code() {
            this.block = new ArrayList<String>();
        }
        public void extend(List<String> block) {
            this.block.addAll(block);
        }
        public void append(String... stmts) {
            for(String stmt : stmts)
                this.block.add(stmt);
        }

        public void gen() {
            echo(".class public sample2");
            echo(".super java/lang/Object");
            echo("");
            echo(".method public <init>()V");
            echo("aload_0");
            echo("invokenonvirtual java/lang/Object/<init>()V");
            echo("return");
            echo(".end method");
            echo("");
            echo(".method public static main([Ljava/lang/String;)V");
            echo(".limit stack 10");
            echo(".limit locals 100");
            echo("");

            for(String i : this.block) echo(i);
            echo("return");
            echo(".end method");
        }
    }
}


prog: block {$block.code.gen();}
    ;

expr returns [Code code]
@init { $code = new Code(); }
    : t=var '+' e=var
            {
                int addr = gen_address();
                $code.extend($t.code.block);
                $code.extend($e.code.block);

                $code.append(
                    iload($t.code.addr),
                    iload($e.code.addr),
                    iadd(),
                    istore(addr));
                $code.addr = addr;
            }
    | e=var { $code = $e.code; }
    ;

repeatStmt returns [Code code]
@init {$code = new Code();}
    : 'repeat' num '{' b=block '}'
       /*{
            int beginLabel = gen_label();
            int endLabel = gen_label();

            $code.append(label(beginLabel));
            $code.extend($num.code.block);
            $code.append(
                iload($num.code.addr),
                ifeq(endLabel));
            $code.extend($b.code.block);
            $code.append(go(beginLabel));
            $code.append(label(endLabel));
       }*/
    ;

block returns [Code code]
@init { $code = new Code(); }
    : (stmt {$code.extend($stmt.code.block);})+
    ;

stmt returns [Code code]
    : printStmt  { $code = $printStmt.code; }
    | assignStmt  { $code = $assignStmt.code; }
    | repeatStmt { $code = $repeatStmt.code; }
    | whileStmt { $code = $whileStmt.code; }
    ;

printStmt returns [Code code]
@init { $code = new Code(); }
    : 'print' '(' e1=expr ',' e2=expr ')'
            { $code.extend($e1.code.block);
              $code.append(
                "getstatic java/lang/System/out Ljava/io/PrintStream;",
                iload($e1.code.addr),
                "invokevirtual java/io/PrintStream/println(I)V");
            
            $code.extend($e2.code.block);
              $code.append(
                "getstatic java/lang/System/out Ljava/io/PrintStream;",
                iload($e2.code.addr),
                "invokevirtual java/io/PrintStream/println(I)V");
            }
    ;
    
exprList returns [Code code]
@init {$code = new Code();}
    : (e=expr {$code.extend($expr.code.block);} ',')* e=expr {$code.extend($e.code.block);}
    ;

assignStmt returns [Code code]
@init {$code = new Code();}
    : 'let' ID '=' expr
        { int varAddr;
          String varName = $ID.text;
          if(symbolTable.containsKey(varName))
            varAddr = symbolTable.get(varName);
          else {
            varAddr = gen_address();
            symbolTable.put(varName, varAddr);
          }

          $code.extend($expr.code.block);
          $code.append(
            iload($expr.code.addr),
            istore(varAddr));
        }
    ;

var returns [Code code]
@init {$code = new Code();}
    : ID { 
        String varName = $ID.text;
        if(symbolTable.containsKey(varName))
            $code.addr = symbolTable.get(varName);
        else {
            int varAddr = gen_address();
            $code.addr = varAddr;
            $code.append(
                ldc(0),
                istore(varAddr));
        }

        }
    | num {$code = $num.code;}
    ;

num returns [Code code]
@init {$code = new Code();}    
    : NUM 
        {
            int addr = gen_address();
            $code.append(
                ldc($NUM.int), 
                istore(addr));
            $code.addr = addr;
        }
    ;

whileStmt returns  [Code code]
@init {$code = new Code();}    
    : 'while' '(' boolExpr ')' '{' block '}'
        {
            int beginLabel = gen_label();
            int endLabel = gen_label();

            $code.append(label(beginLabel));
            $code.extend($boolExpr.code.block);
            $code.append(
                iload($boolExpr.code.addr),
                ifeq(endLabel));
            $code.extend($block.code.block);
            $code.append(go(beginLabel));
            $code.append(label(endLabel));
        }
    ;

boolExpr returns [Code code]
@init {$code = new Code();}
    : e1=expr REL e2=expr
    //need to get this to work for all REL types!        
        {
            int addr = gen_address();
            int trueLabel = gen_label();
            int endLabel = gen_label();

            $code.extend($e1.code.block);
            $code.extend($e2.code.block);
            $code.append(
                iload($e1.code.addr),
                iload($e2.code.addr),
                isub(),
                iflt(trueLabel),
                ldc(0),
                istore(addr),
                go(endLabel),
                label(trueLabel),
                ldc(1),
                istore(addr),
                label(endLabel));
            $code.addr = addr;
        }
    | b1=boolExpr LOGIC b2=boolExpr
    | NEG b=boolExpr
    ;

REL : '=='
    | '<'
    | '>'
    ;

LOGIC
    : 'and'
    | 'or'
    ;

NEG : 'not'
    ;

NUM : ('0' .. '9') + ;
ID : ('a' .. 'z') +;
WS : (' ' | '\t' | '\n' | '\r')+ { skip(); };
