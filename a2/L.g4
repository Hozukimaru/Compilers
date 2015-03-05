grammar L;

parse : stat+ EOF;

stat : LPAREN expr RPAREN {System.out.println($expr.value);}
     | expr {System.out.println($expr.value);}
     | NEWLINE
     ;

expr returns [float value]
    : PLUS  e = var {$value = $e.value;}
        (e = var {$value += $e.value;})+
    | MINUS e = var {$value = $e.value;}
        (e = var {$value -= $e.value;})+
    | MULTI e = var {$value = $e.value;}
        (e = var {$value *= $e.value;})+
    | DIV   e = var {$value = $e.value;}
        (e = var {$value /= $e.value;})+
    | SIN LPAREN e = var RPAREN
        {$value = (float)Math.sin($e.value);}
    | COS LPAREN e = var RPAREN
        {$value = (float)Math.cos($e.value);}
    | TAN LPAREN e = var RPAREN
        {$value = (float)Math.tan($e.value);}
    | SQRT LPAREN e = var RPAREN
        {$value = (float)Math.sqrt($e.value);}
    | NUMBER
    ;

op  : PLUS
    | MINUS
    | MULTI
    | DIV
    ;

var returns [float value]
    : NUMBER {$value = Float.parseFloat($NUMBER.text);}
    | LPAREN  e=expr RPAREN  {$value = $e.value;}
    | expr {System.out.println($expr.value);}
    ;

PLUS  : '+';
MINUS : '-';
MULTI : '*';
DIV   : '/';

SIN : 'sin';
COS : 'cos';
TAN : 'tan';
SQRT: 'sqrt';

LPAREN : '(';
RPAREN : ')';

QUOTE : '"';
DOT   : '.';

ID : ('a'..'z'|'A'..'Z')+;
fragment DIGIT : ('0'..'9')+ ;
NUMBER : DIGIT+ (DOT DIGIT+)?;
NEWLINE:'\r'? '\n' ;
WS : (' '|'\t')+ {skip();};