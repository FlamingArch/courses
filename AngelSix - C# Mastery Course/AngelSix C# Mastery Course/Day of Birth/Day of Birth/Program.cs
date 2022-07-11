using System;
using System.Globalization;

namespace Day_of_Birth
{
    class Program
    {
        static void Main(string[] args)
        {
            IntroduceSavvy();
            var userDOB = AskforDateofBirth();
        }
        public static void IntroduceSavvy()
        {
            Console.WriteLine("Hi! I'm Savvy. I'm really good at guessing the day of the week you were born on.");
        }
        public static DateTimeOffset AskforDateofBirth()
        {
            Console.WriteLine("Can I start by asking you what your date of birth is?: " + CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern);
            var userText = Console.ReadLine();
            var parsedData = DateTimeOffset.MinValue;
            var succeded =  DateTimeOffset.TryParse(userText,out parsedData);

            if (succeded)
            {
                return parsedData;
            }
            else
            {
                Console.WriteLine("You didn't enter a valid date.");
                return AskforDateofBirth();
            }
        }
    }
}
