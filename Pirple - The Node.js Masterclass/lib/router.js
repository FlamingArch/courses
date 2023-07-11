/*
 * Define a request router
 *
 */
const handlers = require("./handlers");

var router = {
  sample: handlers.sample,
  ping: handlers.ping,
  users: handlers.users,
};

module.exports = router;
