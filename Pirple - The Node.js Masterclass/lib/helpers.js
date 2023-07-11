const crypto = require("crypto");
const config = require("./config");

var helpers = {};

// Create a SHA256 hash
helpers.hash = function (str) {
  if (typeof str == "string" && str.length > 0) {
    var hash = crypto
      .createHmac("sha256", config.hashingSecret)
      .update(str)
      .digest("hex");
  } else {
    return false;
  }
};

// Parse a JSON string to an object in all cases, without throwing
helpers.parseJSONToObject = function (str) {
  try {
    var obj = JSON.parse(str);
    return obj;
  } catch {
    return {};
  }
};

module.exports = helpers;
