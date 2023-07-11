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
  // Open the file for writing
  fs.open(lib.basedir + dir + "/" + file + ".json", "wx");
};

// Export the module
module.exports = lib;
