public class DataTypes {
    public static void main(String[] args) {
        // INT Range = -2147483648 to 2147483647:
        int a = 2;
        Integer iA = 2;

        char x = 'x';
        Character cX = 'x';

        String str = "Sample String";

        int n1 = 10, n2 = 5;

        System.out.println(n1 + n2);
        System.out.println(n1 - n2);
        System.out.println(n1 * n2);
        System.out.println(n1 / n2);

        byte b = 21; // Same as int, except with a range of -128 to 127
        short s = 2134; // Same as int, except with a range of -32768 to 32767
        long l = 21343244523422L; // Same as int, except with a range of -9223372036854775808L to
                                  // 9223372036854775807L, needs an L suffix for values larger than the range of
                                  // int.\

        // Larger type can store smaller type, but not vice versa.

        byte b1 = 5;
        short s1 = 20;
        int i1 = 100;
        long l1 = 9999999999L;

        System.out.println(b1);
        System.out.println(s1);
        System.out.println(i1);
        System.out.println(l1);

        System.out.println(b1 - i1);
        System.out.println(s1 - b1);
        System.out.println(i1 - l1);

        System.out.println(i1);
        System.out.println(l1);

        l1 = i1;
        System.out.println(i1);
        System.out.println(l1);

        // BITS AND MEMORY
        // - A bit is the smallest unit to measure memory.
        // - A byte is equal to 0 bits.
        // - Our memory is divided into bytes.
        // - Each variable reserves a certain number of bytes in memory.
        // - More bytes means larger values.
        // - A long reserves more bytes than int.
        // - An int allocates 4 bytes of memory.
        // - A byte allocates 1 byte of memory.

        // SIZE OF DIFFERENT INTEGER DATA TYPES
        // - byte: 1 byte (8 bits)
        // - short: 2 bytes (16 bits)
        // - int: 4 bytes (32 bits)
        // - long: 8 bytes (64 bits)
        // RANGE: Range can be calculated by: [-2^(n-1), 2^(n-1) - 1] where n is the
        // number of bits.

    }
}
