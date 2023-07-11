public class array4SearchingLinear {
  public static void main(String[] args) {
    int[] array = { 3, 2, 4, 4, 3, 2 };
    int item = 4;

    linearSearch(array, item);
  }

  public static boolean linearSearch(int[] array, int item) {
    for (int i = 0; i < array.length; i++) {
      if (item == array[i]) {
        return true;
      }
    }
    return false;
  }
}
