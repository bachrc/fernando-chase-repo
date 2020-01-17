const fs = require("fs")

const parseFile = (path) => {
    try {
        if (fs.existsSync(path)) {
            return fs.readFileSync(path,'utf8');
        }
    } catch (err) {
        
        console.error("File does not exist. Aborting.")
        console.error(err)
    }
};

exports.parseFile = parseFile;
