one:
	javac CPUInfo1.java

two:
	java -jar antlr.jar *.g4
	javac -cp antlr.jar:. *.java

run-one:
	java CPUInfo1 cpus.txt

run-two:
	java -cp antlr.jar:. CPUInfo2 cpus.txt

clean:
	rm -f CPUGrammarLexer*.java
	rm -f CPUGrammarParser*.java
	rm -f CPUGrammar*Listener.java
	rm -f *.tokens *.class

test:
	clear
	make clean
	make two
	clear
	make run-two