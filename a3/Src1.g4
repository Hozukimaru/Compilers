prog
    : block
    ;

expr returns [int val]
    : //fill this in
    ;

repeatStmt
    : 'repeat' expr '{' block '}'
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
    : (expr ',')* expr
    ;

assignStmt
    : 'let' ID '=' expr
    ;
