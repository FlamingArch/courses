
/**
 * guessing
 */
public class guessing {

    public static int turns(int n, int low, int high) {
        int turns = 0;
        int mid = (low + high) / 2;
        if (mid == n) {
            return turns;
        } else if (mid < n) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
        return turns;
    }

    public static void main(String[] args) {
        System.out.println(turns(5000, 0, 100000));
    }

}