/*
 * Create and export configuration variables
 *
 */

var environments = {};

// Staging (default) environment
environments.staging = {
  httpPort: 3000,
  httpsPort: 3001,
  envName: "staging",
  hashingSecret: "thisIsASecret",
};

// Production environment
environments.production = {
  httpPort: 9000,
  httpsPort: 9001,
  envName: "production",
  hashingSecret: "thisIsAlsoASecret",
};

// Determine which environment was passed as a command line argument
var currentEnvironment =
  typeof process.env.NODE_ENV == "string"
    ? process.env.NODE_ENV.toLowerCase()
    : "staging";

// Check the current environment is one of the environments set above
var environmentToExport =
  typeof environments[currentEnvironment] == "object"
    ? environments[currentEnvironment]
    : environments.staging;

// Export the module
module.exports = environmentToExport;
