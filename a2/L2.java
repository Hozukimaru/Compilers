import org.antlr.v4.runtime.*;
import java.io.*;

public class L2 {
	public static void main(String[] args) throws Exception {
		FileInputStream in = new FileInputStream(args[0]);
		ANTLRInputStream input = new ANTLRInputStream(in);
		
		L2Lexer lexer = new L2Lexer(input);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		
		L2Parser parser = new L2Parser(tokens);
		
		parser.parse();
	}
}
