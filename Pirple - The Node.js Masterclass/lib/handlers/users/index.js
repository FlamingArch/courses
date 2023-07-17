// Required data: firstName, lastName, phone, password, tosAgreement
// Optional data: none
const handlers_users = {};

handlers_users.post = require("./post");
handlers_users.get = require("./get");
handlers_users.put = require("./put");
handlers_users.delete = require("./delete");

/**
 * Handler for HTTP verbs at /user
 * Automatically calls the appropriate handler
 * for particular HTTP verb.
 * Supports GET, POST, PUSH, DELETE
 *
 * @param {object} data
 * @param {VoidFunction} callback
 */

userHandler = function (data, callback) {
  var acceptableMethods = ["post", "get", "put", "delete"];

  if (acceptableMethods.indexOf(data.method) > -1) {
    handlers_users[data.method](data, callback);
  } else callback(405);
};

module.exports = userHandler;
