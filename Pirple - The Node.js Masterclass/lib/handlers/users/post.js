const helpers = require("../../helpers");

const sanitizeInput = require("./sanitize");
const validateInput = require("./validate");

function post(data, callback) {
  const userObject = sanitizeInput(data);

  if (validateInput(userObject)) {
    callback(400, { Error: "Missing required fields" });
    return;
  }
  const { password, ...userObjectWithoutPassword } = userObject;

  var hashedPassword = helpers.hash(password);

  if (!hashedPassword) {
    callback(500, { Error: "Could not hash the user's password" });
    return;
  }

  userObject = { ...userObjectWithoutPassword, hashedPassword };

  _data.read("users", phone, (err, data) => {
    if (!err || data) {
      callback(400, { Error: "A user with that phone number already exists" });
      return;
    }

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
  });
}

module.exports = post;
