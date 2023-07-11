/*
 * Request Handlers
 *
 */

const _data = require("./data");
const helpers = require("./helpers");

// Define the handlers
var handlers = {};

handlers.sample = require("./handlers/sample");
handlers.ping = require("./handlers/ping");
handlers.notFound = require("./handlers/notFound");

// Required data: firstName, lastName, phone, password, tosAgreement
// Optional data: none
handlers_users = {};

handlers_users.post = function (data, callback) {
  var firstName =
    typeof data.payload.firstName == "string" &&
    data.payload.firstName.trim().length > 0
      ? data.payload.firstName.trim()
      : false;

  var lastName =
    typeof data.payload.lastName == "string" &&
    data.payload.lastName.trim().length > 0
      ? data.payload.lastName.trim()
      : false;

  var phone =
    typeof data.payload.phone == "string" &&
    data.payload.phone.trim().length == 10
      ? data.payload.phone.trim()
      : false;

  var password =
    typeof data.payload.password == "string" &&
    data.payload.password.trim().length > 0
      ? data.payload.password.trim()
      : false;

  var tosAgreement =
    typeof data.payload.tosAgreement == "boolean" &&
    data.payload.tosAgreement == true
      ? true
      : false;

  if (!(firstName & lastName & phone & password & tosAgreement)) {
    callback(400, { Error: "Missing required fields" });
    return;
  }

  _data.read("users", phone, (err, data) => {
    if (err) {
      callback(400, { Error: "A user with that phone number already exists" });
    } else {
      // Hash the function
      var hashedPassword = helpers.hash(password);

      if (!hashedPassword) {
        callback(500, { Error: "Could not hash the user's password" });
      }

      // Create user object
      var userObject = {
        firstName,
        lastName,
        phone,
        hashedPassword,
        tosAgreement,
      };

      // Store the user
      _data.create("users", phone, userObject, function (err) {
        if (err) {
          console.log(err);
          callback(500, {
            Error: "A user with that phone number already exists",
          });
          return;
        }
        callback(200);
      });
    }
  });
};

handlers_users.get = function (data, callback) {};

handlers_users.put = function (data, callback) {};

handlers_users.delete = function (data, callback) {};

// Users
handlers.users = function (data, callback) {
  var acceptableMethods = ["post", "get", "put", "delete"];

  if (acceptableMethods.indexOf(data.method) > -1) {
    handlers._users[data.method](data, callback);
  } else callback(405);
};

module.exports = handlers;
