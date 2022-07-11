import java.util.*;

class TestClass {
    public static void main(String args[]) throws Exception {
        Scanner s = new Scanner(System.in);
        int length = s.nextInt();
        int[] arr = new int[length];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = s.nextInt();
        }
        bubbleSort(arr);
        s.close();
    }

    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }

        for (int i = arr.length - 1; i >= 0; i--) {
            System.out.print(String.format("%d ", arr[i]));
        }
        System.out.println();
    }

}