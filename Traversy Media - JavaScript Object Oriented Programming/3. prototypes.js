// Prototype (ES5)
function Book(title, author, year) {
  this.title = title;
  this.author = author;
  this.year = year;
}

// getSummary using Prototype
Book.prototype.getSummary = function () {
  return `${this.title} was written by ${this.author} in ${this.year}`;
};

// getAge using Prototype
Book.prototype.getAge = function () {
  const years = new Date().getFullYear() - this.year;
  return `${this.title} is ${years} years old`;
};

// Revise / Change Year
Book.prototype.revise = function (newYear) {
  this.year = newYear;
  this.revised = true;
};

// Instantiate an Object
const book1 = new Book("Book One", "John Doe", 2013);
const book2 = new Book("Book Two", "Jane Doe", 2016);

// Notice that the getSummary is no longer visible in the object directly and has been moved inside __proto__.
console.log("book1 :>> ", book1);
console.log("book1.getSummary() :>> ", book1.getSummary());

console.log("book2.getAge() :>> ", book2.getAge());

console.log('book2 :>> ', book2);
book2.revise('2018')
console.log('book2 :>> ', book2);
