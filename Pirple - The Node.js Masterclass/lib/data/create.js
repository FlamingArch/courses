// Write data to the file
function create(dir, file, data, callback) {
  const pathFile = lib.basedir + dir + "/" + file + ".json";

  // Open the file for writing
  fs.open(pathFile, "wx", (err, fileDescriptor) => {
    if (err || !fileDescriptor) {
      callback("Could not create new file, it may already exist");
      return;
    }

    // Convert Data to String
    var stringData = JSON.stringify(data);

    // Write to file and close it
    fs.writeFile(fileDescriptor, stringData, (err) => {
      if (err) {
        callback("Error writing to new file");
        return;
      }

      fs.close(fileDescriptor, (err) => {
        if (err) callback("Error closing new file");
        else callback(false);
      });
    });
  });
}

module.exports = create;
