public class DataTypes {
    public static void main(String[] args) {
        // INT Range = -2147483648 to 2147483647:
        int a = 2;
        Integer iA = 2;

        char x = 'x';
        Character cX = 'x';

        String str = "Sample String";

        int i1 = 10, i2 = 5;

        System.out.println(i1 + i2);
        System.out.println(i1 - i2);
        System.out.println(i1 * i2);
        System.out.println(i1 / i2);

        byte b = 21; // Same as int, except with a range of -128 to 127
        short s = 2134; // Same as int, except with a range of -32768 to 32767
        long l = 21343244523422L; // Same as int, except with a range of -9223372036854775808L to 9223372036854775807L, needs a L suffix for values larger than the range of int.\

        // Larger type can store smaller type, but not vice versa.
        
    }
}