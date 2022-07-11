using System;

namespace Methods
{
    class Program
    {
        //Entry Point for Application
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine(GetUserDateofBirth("Something"));
            Console.WriteLine(GetUserDateofBirth("Something2"));
        }
        public static string GetUserDateofBirth(string fullName)
        {
            return fullName + " was born on tuesday.";
        }
    }
}
