/*
 * Primary file for API
 *
 */

// Dependencies
const http = require("http");
const https = require("https");
const fs = require("fs");
const unifiedServer = require("./lib/server");
const config = require("./lib/config");

const httpServer = http.createServer(unifiedServer);

const status = (port, name) =>
  `:: The server is listening on port ${port} in ${name} now`;

httpServer.listen(config.httpPort, function () {
  console.log(status(config.httpPort, config.envName));
});

const httpsServerOptions = {
  key: fs.readFileSync("./https/key.pem"),
  certificate: fs.readFileSync("./https/cert.pem"),
};

var httpsServer = https.createServer(httpsServerOptions, unifiedServer);

httpsServer.listen(config.httpsPort, () =>
  console.log(status(config.httpsPort, config.envName))
);
