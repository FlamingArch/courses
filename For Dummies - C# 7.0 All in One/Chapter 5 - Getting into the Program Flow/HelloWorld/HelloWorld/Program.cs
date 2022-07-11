using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] planets = new string[] {"Mercury", "Venus" , "Earth", "Mars", "Jupiter"};

            Console.WriteLine("Five planets nearest to the sun:");
            foreach (string planet in planets)
            {
                Console.WriteLine("\t" + planet);
            }

            string[] sortedNames = planets;
            Array.Sort(sortedNames);
            Console.WriteLine("Now Listed Alphabetically:");
            foreach (string planet in sortedNames)
            {
                Console.WriteLine("\t" + planet);
            }


            Console.WriteLine("Now Listed by Name Length in Increasing order:");
            foreach (string planet in sortedNames)
            {
                Console.WriteLine("\t" + planet);
            }

            int inner, outer;

            for (outer = planets.Length-1; outer >= 0; outer--)
            {
                for (inner = 1; inner <= outer; inner++)
                {
                    if (planets[inner-1].Length > planets[inner].Length)
                    {
                        string temp = planets[inner];
                        planets[inner] = planets[inner - 1];
                        planets[inner - 1] = temp;
                    }

                }
            }


        }
    }
}
