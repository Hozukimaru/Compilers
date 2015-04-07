grammar Src1;

@header {
    import java.util.*;
}

@members {
    HashMap memory = new HashMap();
    static int addr_index = 0;
    static int gen_addr() {
        return(addr_index ++);
    }

    static int label_index = 0;
    static int gen_label() {
        return(label_index ++);
    }

    //Java byte code sheeeeit
    static void echo(String message) {
        System.out.println(message);
    }
    
    static String iload(int addr) {
        return "iload " + addr;
    }
    
    static String istore(int addr) {
        return "istore " + addr;
    }
    
    static String iadd() {return "iadd";}
    static String isub() {return "isub";}
    static String imul() {return "imul";}
    
    static String ldc(int x) {
        return "ldc " + x;
    }

    static String iflt(int l) {return "iflt LABEL_"+l;}
    static String ifeq(int l) {return "ifeq LABEL_"+l;}
    static String go(int l) {return "goto LABEL_"+l;}
    static String label(int l) {return "LABEL_"+l+":";}

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
            echo(".class public Hello");
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
        }
    }
}

prog
    : b=block {$b.code.gen();}
    ;

expr returns [Code code, int val]
@init {$code = new Code();} 
    : e1 = var '+' e2 = var {$val = $e1.val + $e2.val;}
    | e = var {$val = $e.val;}
    ;

repeatStmt returns [Code code]
@init {$code = new Code();} 
    : 'repeat' num '{' block '}'
    ;

block returns [Code code]
@init {$code = new Code();} 
    : stmt+
    ;

stmt returns [Code code]
@init {$code = new Code();} 
    : printStmt {$code = $printStmt.code;}
    | assignStmt {$code = $assignStmt.code;}
    | repeatStmt {$code = $repeatStmt.code;}
    ;

printStmt returns [Code code]
@init {$code = new Code();} 
    : 'print' '(' exprList ')' {$code = $exprList.code;}
    ;

exprList returns [Code code]
@init {$code = new Code();} 
    : (e1 = expr ',')* e2 = expr {System.out.println($e1.val+" "+$e2.val);}
    ;

assignStmt returns [Code code]
@init {$code = new Code();} 
    : 'let' ID '=' expr {memory.put($ID.text, new Integer($expr.val));}
    ;

var returns [int val, Code code]
@init {$code = new Code();} 
    : num {$val = $num.val;}
    | ID {
        Integer v = (Integer)memory.get($ID.text);
        if (v != null) $val = v.intValue();
        else System.err.println("Unknown variable " + $ID.text);
    }
    ;

num returns [int val, Code code]
@init {$code = new Code();} 
    : NUM {$val = Integer.parseInt($NUM.text);}
    ;

ID  : ('a'..'z'|'A'..'Z')+;
NUM : ('0'..'9')+;
WS  : (' '|'\t'|'\n'|'\r')+ {skip();};
