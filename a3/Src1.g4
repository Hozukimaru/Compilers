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
}

prog
    : block
    ;

expr returns [int val]
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
