import org.antlr.v4.runtime.*;
import java.io.*;

public class Compiler1 {
	public static void main(String[] args) throws Exception {
		FileInputStream in = new FileInputStream(args[0]);
		ANTLRInputStream input = new ANTLRInputStream(in);
		
		Src1Lexer lexer = new Src1Lexer(input);
		
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		
		Src1Parser parser = new Src1Parser(tokens);
		
		parser.prog();
	}
}
