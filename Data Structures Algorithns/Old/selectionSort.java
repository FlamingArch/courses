import java.util.*;

class TestClass {
    public static void main(String args[]) throws Exception {
        Scanner s = new Scanner(System.in);
        int length = s.nextInt();
        int[] arr = new int[length];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = s.nextInt();
        }
        selectionSort(arr);
        s.close();
    }

    public static void selectionSort(int[] arr) {
        for (int i = 0; i < arr.length - 1; i++) {
            int index = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[index]) {
                    index = j;
                }
            }
            int smallerNumber = arr[index];
            arr[index] = arr[i];
            arr[i] = smallerNumber;
            for (int num : arr) {
                System.out.print(String.format("%d ", num));
            }
            System.out.println();
        }
    }
}