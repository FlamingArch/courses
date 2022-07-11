using System;
using System.IO;

namespace LoopThroughFiles
{
    class Program
    {
        static void Main(string[] args)
        {
            string directoryName;
            if (args.Length == 0)
                directoryName = Directory.GetCurrentDirectory();
            else
                directoryName = args[0];
            Console.WriteLine(directoryName);
            FileInfo[] files = GetFileList(directoryName);

            foreach (FileInfo file in files)
            {
                Console.WriteLine("\n\nhex dump of file {0}: ", file.FullName);

                DumpHex(file);

                Console.WriteLine("\nEnter Return to Continue to next file");
                Console.ReadLine();
            }

            Console.WriteLine("\nNo Files Left");

            Console.WriteLine("Press Enter to Terminate...");
            Console.Read();
        }

        static FileInfo[] GetFileList(string directoryName)
        {
            FileInfo[] files = new FileInfo[0];
            try
            {
                DirectoryInfo di = new DirectoryInfo(directoryName);
                files = di.GetFiles();
            }
            catch (Exception e)
            {
                Console.WriteLine("Directory \"{0}\" invalid", directoryName);
                Console.WriteLine(e.Message);
            }
            return files;
        }

        static void DumpHex(FileInfo file)
        {
            //Open File
            FileStream fs;
            BinaryReader reader;
            try
            {
                fs = file.OpenRead();
                //Wrap the file stream in a Binary Reader
                reader = new BinaryReader(fs);
            }
            catch (Exception e)
            {
                Console.WriteLine("\nCan't read from \"{0}\"", file.FullName);
                Console.WriteLine(e.Message);
                throw;
            }

            for (int line = 1; true ; line++)
            {
                byte[] buffer = new byte[10];
                int numBytes = reader.Read(buffer, 0, buffer.Length);
                if (numBytes == 0)
                {
                    return;
                }
                Console.Write("{0:D3} - ", line);
                DumpBuffer(buffer, numBytes);

                if ((line % 20)==0)
                {
                    Console.WriteLine("Enter return to continue another 20 lines");
                }
            }
        }

        static void DumpBuffer(byte[] buffer, int numBytes)
        {
            for (int index = 0; index < numBytes; index++)
            {
                byte b = buffer[index];
                Console.Write("{0:X2}, ", b);
            }
            Console.WriteLine();
        }
    }
}
