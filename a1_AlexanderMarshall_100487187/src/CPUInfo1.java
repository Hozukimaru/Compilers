//Alexander Marshall - 100487187
import java.io.*;
import java.util.regex.*;

public class CPUInfo1 {
	public static void main(String[] args) {
		try {
			File file = new File(args[0]);
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line;

      Pattern cpu = Pattern.compile("<tr><td id=(.+?) class=\"chart\"><a href=(.+?)>(.+?)</a></td><td id=(.+?) class=\"value\"><img src=(.+?)/>(.+?)</td>");
      Pattern price = Pattern.compile("<td class=\"chart\"><a href=(.+?)>(.+?)</a></td></tr>");

			while((line = br.readLine()) != null) {
				Matcher m0 = cpu.matcher(line);
				Matcher m1 = price.matcher(line);

				while(m0.find()){
					if(m0.group(3).contains("@")){
						String[] parts = m0.group(3).split("@");
						System.out.print(parts[0] + "|"+ parts[1] + " |" + m0.group(6) + " | ");
					} else {
						System.out.print(m0.group(3) + " | NA | " + m0.group(6) + " | ");
					}
				}

				while(m1.find()){
					System.out.print(m1.group(2) + "\n");
				}
			}
		} catch(FileNotFoundException e) {
			System.out.println("File not found!");
		} catch(IOException e) {
			System.out.println("IO error!");
		}
	}
}
