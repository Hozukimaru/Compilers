build:
	java -jar antlr.jar L.g4
	javac -cp antlr.jar:. *.java

one:
	java -cp antlr.jar:. L test.L

two:
	java -cp antlr.jar:. L2 test.L2

clean:
	rm -f LLexer*.java
	rm -f LParser*.java
	rm -f L*Listener.java
	rm -f L2Lexer*.java
	rm -f L2Parser*.java
	rm -f L2*Listener.java
	rm -f *.tokens *.class

test:
	clear
	make clean
	clear
	make build
	clear
	make one