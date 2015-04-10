build:
	java -jar antlr.jar Src1.g4
	javac -cp antlr.jar:. *.java
	java -cp antlr.jar:. Compiler1 sample.src > sample.j
	java -jar jasmin.jar sample.j

run:
	java sample

clean:
	rm -f Src1Lexer*.java
	rm -f Src1Parser*.java
	rm -f Src1*Listener.java
	rm -f *.tokens *.class
