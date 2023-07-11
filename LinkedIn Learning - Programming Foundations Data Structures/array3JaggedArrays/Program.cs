
public class Program
{
  public static void Main(string[] args)
  {

    int[][] jagged = new int[3][];

    jagged[0] = new int[2];
    jagged[0][0] = 8;
    jagged[0][1] = 10;

    jagged[1] = new int[9];

    jagged[2] = new int[4] { 20, 30, 40, 50 };

    Console.WriteLine("At row 2, col 0:" + jagged[2][0]);
  }
}
