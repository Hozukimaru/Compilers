grammar CPUGrammar;

parse
 : thing+
 ;

thing
	: cpu 
 	| cost
 	| cpuscore
 	| OTHER
 	;

cpu
 	: '">' Name { System.out.println("Name:" + $Name.text); } '@' Speed { System.out.println("Speed:" + $Speed.text); }
 	;

cost
 	: '#price">' Price { System.out.println("Price:" + $Price.text); }
 	;

cpuscore
 	: ')"/>' Score { System.out.println("Score:" + $Score.text); }
 	;

Name
 	: (('A' .. 'Z')+ ('a' .. 'z')+ | ('0' .. '9')+)
 	;

Speed
 	: ('0' .. '9')('.')('0' .. '9')+('GHz')
 	;

Score
 	: ('0' .. '9')+('.' | ',')+('0' .. '9')+
 	| 'NA'
 	;

Price
 	: ('$')('0' .. '9')+('.')('0' .. '9')+
 	| 'NA'
 	;

WS
 	: (' '|'\t'|'\f'|'\n'|'\r')+ -> skip
 	;

OTHER
 	: . -> skip
 	;