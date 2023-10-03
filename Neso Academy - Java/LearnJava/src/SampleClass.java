public class SampleClass {
    public static void main(String[] args) {
        System.out.printf("Before sayHi");
        sayHi();
    }

    // Public: Can be accessed from inside and outside of class.
    // Private: Cannot be accessed from outside the class.
    // Static: Access the methods directly from class instead of having to instantiate an object.
    private static void sayHi() {
        System.out.printf("Hi from SampleClass");
    }


}
