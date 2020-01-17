using System;
using System.IO;

namespace Main
{
    public class Program
    {
        public static void Main(string[] args)
        {
            LaunchProgram(args);
        }

        public static void LaunchProgram(string[] args)
        {
            if (args.Length != 1)
            {
                throw new Exception("Should have only one input");
            }

            var inputPath = args[0];
            if (!File.Exists(inputPath))
            {
                throw new Exception("File does not exist");
            }

            string readText = File.ReadAllText(inputPath);

            Console.Write(readText);
        }
    }
}