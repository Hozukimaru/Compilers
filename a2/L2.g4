grammar L2;

@header {
    import java.util.HashMap;
}

@members {
    HashMap memory = new HashMap();
}

parse : stat+ EOF;

stat : expr {System.out.println($expr.value);}
     | comp {System.out.println($comp.value);}
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
    | POW e1 = var e2 = var
        {$value = (float)Math.pow($e1.value, $e2.value);}
    | LOG e = var
        {$value = (float)Math.log($e.value);}
    | MAX e1 = var e2 = var
        {$value = (float)Math.max($e1.value, $e2.value);}
    | MIN e1 = var e2 = var
        {$value = (float)Math.min($e1.value, $e2.value);}
    | NUMBER {$value = Float.parseFloat($NUMBER.text);}
    | QUOTE message QUOTE e = var
        {$value = $e.value;}
        {System.out.print($message.value);}
    ;

comp returns [boolean value]
    : LPAREN c = comp RPAREN
        {$value = $c.value;}
    | GREAT e1 = var e2 = var
        {$value = ($e1.value > $e2.value);}
    | LESS e1 = var e2 = var
        {$value = ($e1.value < $e2.value);}
    |EQUAL e1 = var e2 = var
        {$value = ($e1.value == $e2.value);}
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
    : e = (ID|NUMBER|PLUS|MINUS|MULTI|DIV|SIN
          |COS|TAN|SQRT|LPAREN|RPAREN|POW|EQUAL|GREAT|LESS) 
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
POW : '^';
LOG : 'log';
MAX : 'max';
MIN : 'min';

GREAT: '>';
LESS : '<';
EQUAL: '=';

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
