import org.antlr.v4.runtime.*;
import java.io.*;

public class Compiler2 {
	public static void main(String[] args) throws Exception {
		FileInputStream in = new FileInputStream(args[0]);
		ANTLRInputStream input = new ANTLRInputStream(in);
		
		Src2Lexer lexer = new Src2Lexer(input);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		
		Src2Parser parser = new Src2Parser(tokens);
		
		parser.prog();
	}
}
