// Package Management

// Package
// A reusable bundle of code and/or assets
// Example: Libraries (React, Angular, Express, etc), Tools (Typescript compiler, etc)
//     Shared Components (Your custom controls, etc), or even your app.
// Packages are also called dependencies or modules

// NPM
// World's largest software registry

// Example of Package in action: A full functioning webserver:
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(3000, ()=> {
    console.log(`Server Listening at http://localhost:${port}`)
})

// package.json
// Every Project's Starting Point
// Metadata: your project's name, version, description, author, license, etc.
// Dependencies: the list of packages used by your project
// Scripts: commands to automate your development tasks
// Can be created using `npm init`. Questions can be skipped by -y argument.
// Download and install package to dependencies: npm install <package_name>
// Download and install package to devDependencies: npm install --save-dev <package_name>

// dependencies vs devDependencies
// dependencies: Packages needed to run application in production
// devDependencies: Packages needed only while developing application, and won't be shipped in production.
