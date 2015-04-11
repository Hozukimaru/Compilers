build1:
	java -jar antlr.jar Src1.g4
	javac -cp antlr.jar:. *1*.java
	java -cp antlr.jar:. Compiler1 sample.src > sample.j
	java -jar jasmin.jar sample.j

build2:
	java -jar antlr.jar Src2.g4
	javac -cp antlr.jar:. *2*.java
	java -cp antlr.jar:. Compiler2 sample2.src > sample2.j
	java -jar jasmin.jar sample2.j

run1:
	java sample

run2:
	java sample2

clean:
	rm -f Src1Lexer*.java
	rm -f Src2Lexer*.java
	rm -f Src1Parser*.java
	rm -f Src2Parser*.java
	rm -f Src1*Listener.java
	rm -f Src2*Listener.java
	rm -f *.tokens *.class
