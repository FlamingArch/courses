function read(dir, file, callback) {
  let pathFile = lib.basedir + dir + "/" + file + ".json";
  fs.readFile(pathFile, "utf-8", callback); // callback(err, data)
}

module.exports = read;
