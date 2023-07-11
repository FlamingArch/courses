/*
 * Library for storing and editing data
 *
 */

// Dependencies
const fs = require("fs");
const path = require("path");

// Container for the module (to be exported)
var lib = {};

// Base directory of the data folder
lib.basedir = path.join(__dirname, "/../.data/");

// Write data to the file
lib.create = function (dir, file, data, callback) {
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
};

lib.read = function (dir, file, callback) {
  let pathFile = lib.basedir + dir + "/" + file + ".json";
  fs.readFile(pathFile, "utf-8", callback); // callback(err, data)
};

lib.update = function (dir, file, data, callback) {
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
};

lib.delete = function (dir, file, callback) {
  let pathFile = lib.basedir + dir + "/" + file + ".json";

  // Unlink the file
  fs.unlink(pathFile, (err) => {
    if (err) callback("Error deleting file");
    else callback(false);
  });
};

// Export the module
module.exports = lib;
