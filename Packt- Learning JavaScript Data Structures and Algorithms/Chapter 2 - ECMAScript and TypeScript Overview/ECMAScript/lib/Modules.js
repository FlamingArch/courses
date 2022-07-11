//Modules.js

// import { circleArea as Circle, squareArea as Square } from './ModulesSupporting'; // {2}

// console.log(Circle(2));
// console.log(Square(2));

import Book from "./ModulesSupportingBook.js";

const myBook = new Book("Some Title");
myBook.printTitle();