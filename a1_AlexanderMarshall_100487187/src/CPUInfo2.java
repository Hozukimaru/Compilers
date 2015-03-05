import org.antlr.v4.runtime.*;
import java.io.*;

public class CPUInfo2 {
	public static void main(String[] args) throws Exception {
		FileInputStream in = new FileInputStream(args[0]);
		ANTLRInputStream input = new ANTLRInputStream(in);
		
		CPUGrammarLexer lexer = new CPUGrammarLexer(input);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		
		CPUGrammarParser parser = new CPUGrammarParser(tokens);
		
		parser.parse();
	}
}