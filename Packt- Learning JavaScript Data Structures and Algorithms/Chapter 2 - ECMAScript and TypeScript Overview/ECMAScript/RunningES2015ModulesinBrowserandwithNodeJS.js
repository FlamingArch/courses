//RunningES2015ModulesinBrowserandwithNodeJS.js

const area = require("./lib/ModulesSupporting");
const Book = require("./lib/ModulesSupportingBook");

console.log(area.circleArea(2));
console.log(area.squareArea(2));

const myBook = new Book('Some title');
myBook.printTitle();