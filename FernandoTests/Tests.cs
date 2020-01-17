using System;
using System.IO;
using NUnit.Framework;

namespace FernandoTests
{
    [TestFixture]
    public class Tests
    {
        [Test]
        public void ShouldFailWhenCalledWithNoArgs()
        {
            string[] args = new string[0];
            Assert.Throws<Exception>(() => Main.Program.LaunchProgram(args));

        }
        
        [Test]
        public void ShouldFailWhenCalledWhenArgIsNotAFile()
        {
            string[] args = {"erreur"};
            Assert.Throws<Exception>(() => Main.Program.LaunchProgram( args));
        }
        
        [Test]
        public void ShouldPrintContentOfTestFile()
        {
            var originalConsoleOut = Console.Out; // preserve the original stream
            
            string myTempFile = Path.Combine(Path.GetTempPath(), "test.txt");
            var expected = "wesh";
            using(StreamWriter sw = new StreamWriter(myTempFile))
            {
                sw.Write(expected);
            }
            
            using(var writer = new StringWriter())
            {
                Console.SetOut(writer);
                
                string[] args = {myTempFile};
                Main.Program.LaunchProgram( args);

                writer.Flush(); // when you're done, make sure everything is written out

                var myString = writer.GetStringBuilder().ToString();
                Assert.AreEqual(expected,myString);
            }

            Console.SetOut(originalConsoleOut);
        }
    }
}