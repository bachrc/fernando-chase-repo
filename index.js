const fileParser = require("./fileParser")

const inputPath = process.argv[2];

if(inputPath === undefined) {
    console.error("No argument is passed to the program. Aborting.")
    return;
}

const fileContent = fileParser.parseFile(inputPath);
console.log(fileContent);