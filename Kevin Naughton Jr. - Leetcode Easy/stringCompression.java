/**
 * straight from video.
 */
public class stringCompression {
    public static void main(String[] args) {
        System.out.println(compress("abbbbbbbbbbbb".toCharArray()));
    }

    public static int compress(char[] chars) {
        int index = 0;
        int i = 0;
        while (i < chars.length) {
            int j = i;
            while (j < chars.length && chars[j] == chars[i]) {
                j++;
            }
            if (j - i > 1) {
                String count = j - i + "";
                for (char c : count.toCharArray()) {
                    chars[index++] = c;
                }
            }
            i=j;
        }
        return index;
    }
}
