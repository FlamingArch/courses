import java.net.*;
import java.io.*;

public class FetchUrl {
  public static void main(String[] args) {
    try {
      // Get the URL from the command line argument
      String urlStr = args[0];
      URL url = new URI(urlStr).toURL();

      // Open a connection to the URL and send a GET request
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("GET");

      // Read the response from the server
      BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
      String inputLine;
      StringBuilder response = new StringBuilder();
      while ((inputLine = in.readLine()) != null) {
        response.append(inputLine);
      }
      in.close();

      // Print the response to the console
      System.out.println(response.toString());
    } catch (Exception e) {
      System.out.println("Error: " + e.getMessage());
    }
  }
}
