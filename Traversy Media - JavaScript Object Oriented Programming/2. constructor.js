// Constructor (ES5)
function Book(title, author, year) {
  this.title = title;
  this.author = author;
  this.year = year;
  this.getSummary = function () {
    return `${this.title} was written by ${this.author} in ${this.year}`;
  };
}

// Instantiate an Object
const book1 = new Book("Book One", "John Doe", 2013);
const book2 = new Book("Book Two", "Jane Doe", 2016);

console.log("book1.title :>> ", book1.title);
console.log("book1 :>> ", book1);
console.log('book1.getSummary() :>> ', book1.getSummary());

console.log("book2.title :>> ", book2.title);
console.log('book2 :>> ', book2);
console.log('book2.getSummary() :>> ', book2.getSummary());
