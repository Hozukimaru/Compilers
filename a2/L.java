import org.antlr.v4.runtime.*;
import java.io.*;

public class L {
	public static void main(String[] args) throws Exception {
		FileInputStream in = new FileInputStream(args[0]);
		ANTLRInputStream input = new ANTLRInputStream(in);
		
		LLexer lexer = new LLexer(input);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		
		LParser parser = new LParser(tokens);
		
		parser.parse();
	}
}