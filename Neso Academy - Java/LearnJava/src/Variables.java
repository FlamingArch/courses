public class Variables {

    // NAMING RULES:
    // - Can contain letters, digits, underscore and dollar signs ($)
    //   -> myName1, my_name2, my$
    // - Must start with a letter or an underscore, or dollar sign.
    //   It cannot start with a digit, and it cannot contain spaces.
    //   -> hello, i, _myName, $1, $myAge => OK
    //   -> 1hello, @hi, *name, my age    => NOT OK
    // - Cannot be a reserved keyword (main, static, class, etc.)

    public static void main(String[] args) {
        String myName;
        myName = "John Doe";

        String myJob = "Programmer";
        System.out.println(myJob);

        String myNameCopy = myName;
        myName = "Jane Doe";
        System.out.println(myName);
        System.out.println(myNameCopy);

        String arg1 = args[0];
        System.out.println(arg1);
    }
}
