// jshint esversion:6

// USING NATIVE NODE MODULES

// Import FileSystem Module
const fs = require("fs");
// Create a copy of file
fs.copyFileSync("./file1.txt", "file2.txt");


// USING EXTERNAL MODULES INSTALLED BY NODEJS
const superheroes = require('superheroes');
const supervillains = require('supervillains');
console.log('superheroes.random() :>> ', superheroes.random());
console.log('supervillains.random() :>> ', supervillains.random());