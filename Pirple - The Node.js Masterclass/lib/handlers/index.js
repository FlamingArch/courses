/*
 * Request Handlers
 *
 */

const _data = require("../data");
const helpers = require("../helpers");

// Define the handlers
var handlers = {};

handlers.sample = require("./sample");
handlers.ping = require("./ping");
handlers.notFound = require("./notFound");
handlers.users = require("./users");

module.exports = handlers;
