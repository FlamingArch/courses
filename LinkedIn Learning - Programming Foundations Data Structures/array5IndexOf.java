import java.util.ArrayList;

public class array5IndexOf {
  public static void main(String[] args) {
    ArrayList<Integer> myarArrayList = new ArrayList<>();
    for (int i = 0; i < 10; i++) {
      myarArrayList.add(i);
    }
    myarArrayList.add(2, 10);
    System.out.println(myarArrayList);

    System.out.println(myarArrayList.indexOf(39));
    System.out.println(myarArrayList.indexOf(9));
  }
}
