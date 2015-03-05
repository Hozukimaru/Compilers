import org.antlr.v4.runtime.*;

public class Lab{
 public static void main(String[] args) throws Exception {
     ANTLRInputStream input = new ANTLRInputStream(System.in);
     // Construct a lexer 
     LabLexer lexer = new LabLexer(input);
     // Obtain the token stream from the lexer
     CommonTokenStream tokens = new CommonTokenStream(lexer);
     // Parse the token stream using the parser
     LabParser parser = new LabParser(tokens);
     // Start parsing, starting with the `r` rule.
     parser.parse();
 }
}
