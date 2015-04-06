grammar Src1;

@header {
    import java.util.*;
}

@members {
    HashMap memory = new HashMap();
    static int addr_index = 0;
    static int gen_addr() {
        return(addr_index++);
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
    
    static String iadd() {
        return "iadd";
    }
    
    static String imul() {
        return "imul";
    }
    
    static String ldc(int x) {
        return "ldc " + x;
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
    : block
    ;

expr returns [Code code, int val]
    @init {$code = new Code();} 
    : e1 = var '+' e2 = var {$val = $e1.val + $e2.val;}
    | e = var {$val = $e.val;}
    ;

repeatStmt
    : 'repeat' num '{' block '}'
    ;

block
    : stmt+
    ;

stmt
    : printStmt
    | assignStmt
    | repeatStmt
    ;

printStmt
    : 'print' '(' exprList ')'
    ;

exprList
    : (e1 = expr ',')* e2 = expr {System.out.println($e1.val+" "+$e2.val);}
    ;

assignStmt
    : 'let' ID '=' expr {memory.put($ID.text, new Integer($expr.val));}
    ;

var returns [int val]
    : num {$val = $num.val;}
    | ID {
        Integer v = (Integer)memory.get($ID.text);
        if (v != null) $val = v.intValue();
        else System.err.println("Unknown variable " + $ID.text);
    }
    ;

num returns [int val]
    : NUM {$val = Integer.parseInt($NUM.text);}
    ;

ID  : ('a'..'z'|'A'..'Z')+;
NUM : ('0'..'9')+;
WS  : (' '|'\t'|'\n'|'\r')+ {skip();};
