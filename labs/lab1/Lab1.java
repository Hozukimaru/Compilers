//Alexander Marshall - 100487187
import java.io.*;
import java.util.regex.*;

public class Lab1 {
	public static void main(String[] args) {
		Pattern p0 = Pattern.compile("(?i)<a([^>]+)>(.+?)</a>"); //links
		Pattern p1 = Pattern.compile("(?i)<link rel=\"stylesheet\""); //stylesheets
		Pattern p2 = Pattern.compile("(?i)<img"); //image tags

		int c0 = 0; int c1 = 0; int c2 = 0;

		try {
			File file = new File("yahoo.html");
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line;

			while((line = br.readLine()) != null) {
				Matcher m0 = p0.matcher(line);
				Matcher m1 = p1.matcher(line);
				Matcher m2 = p2.matcher(line);
				
				while(m0.find()) {
					//System.out.print("Start index: " + m0.start() + " ");
					//System.out.print("End index: " + m0.end() + " ");
					//System.out.println(m0.group());
					c0++;
				}
				
				while(m1.find()) {
					//System.out.print("Start index: " + m1.start() + " ");
					//System.out.print("End index: " + m1.end() + " ");
					//System.out.println(m1.group());
					c1++;
				}

				while(m2.find()) {
					//System.out.print("Start index: " + m2.start() + " ");
					//System.out.print("End index: " + m2.end() + " ");
					//System.out.println(m2.group());
					c2++;
				}
			}
			System.out.println("LINKS: " + c0);
			System.out.println("STYLESHEETS: " + c1);
			System.out.println("IMAGE TAGS: " + c2);
			br.close();
		} catch (FileNotFoundException e) {
			System.out.println("File cannot be found!");
		} catch(IOException e) {
			System.out.println("IOException!");
		}
	}
}
