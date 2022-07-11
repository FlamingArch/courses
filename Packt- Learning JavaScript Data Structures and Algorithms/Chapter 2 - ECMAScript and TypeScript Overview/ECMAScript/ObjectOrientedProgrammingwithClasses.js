//ObjectOrientedProgrammingwithClasses.js

// Before ES6:
// function Book(title, pages, isbn) {
//   this.title = title;
//   this.pages = pages;
//   this.isbn = isbn;
// }
// Book.prototype.printTitle = function () {
//   console.log(this.title);
// };

// Same as:
class Book {
  constructor(title, pages, isbn) {
    this.title = title;
    this.pages = pages;
    this.isbn = isbn;
  }
  printIsbn() {
    console.log(this.isbn);
  }
}

let book = new Book("title", "page", "isbn");
console.log(book.title);
book.title = "new title";
console.log(book.title);
