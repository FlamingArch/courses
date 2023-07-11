function update(dir, file, data, callback) {
  const pathFile = lib.basedir + dir + "/" + file + ".json";

  // Open file
  fs.open(pathFile, "r+", (err, fileDesc) => {
    if (err || !fileDesc) {
      callback("Could not open the file for updating");
      return;
    }

    // Convert data to String
    var stringData = JSON.stringify(data);

    // Truncate the file
    // fs.truncate (deprecated) was used in course
    fs.ftruncate(fileDesc, (err) => {
      if (err) {
        callback("Error Truncating File");
        return;
      }

      fs.writeFile(fileDesc, stringData, (err) => {
        if (err) {
          callback("Error writing to existing file");
          return;
        }

        fs.close(fileDesc, (err) => {
          if (err) callback("Error Closing the File");
          else callback(false);
        });
      });
    });
  });
}

module.exports = update;
