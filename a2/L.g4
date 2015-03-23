grammar L;

@header {
    import java.util.HashMap;
}

@members {
    HashMap memory = new HashMap();
}

parse : stat+ EOF;

stat : expr {System.out.println($expr.value);}
     | NEWLINE
     ;

expr returns [float value]
    : LPAREN e = var RPAREN {$value = $e.value;}
    | LET ID ASSIGN var {memory.put($ID.text, new Float($var.value));}
        IN e = var {$value = $e.value;}
    | PLUS  e = var {$value = $e.value;}
        (e = var {$value += $e.value;})+
    | MINUS e = var {$value = $e.value;}
        (e = var {$value -= $e.value;})+
    | MULTI e = var {$value = $e.value;}
        (e = var {$value *= $e.value;})+
    | DIV   e = var {$value = $e.value;}
        (e = var {$value /= $e.value;})+
    | SIN e = var
        {$value = (float)Math.sin($e.value);}
    | COS e = var
        {$value = (float)Math.cos($e.value);}
    | TAN e = var
        {$value = (float)Math.tan($e.value);}
    | SQRT e = var
        {$value = (float)Math.sqrt($e.value);}
    | NUMBER {$value = Float.parseFloat($NUMBER.text);}
    | QUOTE message QUOTE e = var
        {$value = $e.value;}
        {System.out.print($message.value);}
    ;

message returns [String value]
    : {$value = "";} (string {$value += $string.value;})+
    ;

var returns [float value]
    : LPAREN  e=expr RPAREN  {$value = $e.value;}
    | expr {$value = $expr.value;}
    | ID {
        Float v = (Float)memory.get($ID.text);
        if (v != null) $value = v.floatValue();
        else System.err.println("Unknown variable " + $ID.text);
        }
    ;

string returns [String value]
    : e = (ID|NUMBER|PLUS|MINUS|MULTI|DIV|SIN|COS|TAN|SQRT|LPAREN|RPAREN|'='|'^') 
        {$value = $e.text + " ";}
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
LET   : 'let';
ASSIGN: 'be';
IN    : 'in';

ID             : ('a'..'z'|'A'..'Z')+;
fragment DIGIT : ('0'..'9')+ ;
NUMBER         : DIGIT+ (DOT DIGIT+)?;
NEWLINE        : ('\r'? '\n')+ {skip();};
WS             : (' '|'\t')+ {skip();};
