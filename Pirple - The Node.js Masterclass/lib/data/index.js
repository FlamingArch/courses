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

lib.create = require("./create");
lib.read = require("./read");
lib.update = require("./update");
lib.delete = require("./delete");

// Export the module
module.exports = lib;
