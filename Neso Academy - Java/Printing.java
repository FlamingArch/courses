public class Printing {
  public static void main(String[] args) {

    System.out.println(" - out is an object of the PrintStream class.");
    System.out.println(" - out has the print() and println() methods. Use '.' to access the print()/println() of out");
    System.out.println(" - out refers to the standard output device (screen).");
    System.out.println(" - System is a Class (Pascal case)");
    System.out.println(" - out is inside system (field). Use '.' to access out of System");

    // No trailing line break
    System.out.print("hello");
    System.out.print("123");
    System.out.print("");
    System.out.print("456");

    // With trailing line break
    System.out.println("hello");
    System.out.println("123");
    System.out.println("");
    System.out.println("456");
  }
}
