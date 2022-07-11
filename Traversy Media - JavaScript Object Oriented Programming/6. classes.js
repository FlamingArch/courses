// Class Syntax (ES6)
class Book {
  constructor(title, author, year) {
    this.title = title;
    this.author = author;
    this.year = year;
  }
  static topBookStores() {
    return `Barnes & Noble`;
  }
  getSummary() {
    return `${this.title} was written by ${this.author} in ${this.year}`;
  }

  getAge() {
    const years = new Date().getFullYear() - this.year;
    return `${this.title} is ${years} years old`;
  }
  revise(newYear) {
    this.year = newYear;
    this.revised = true;
  }
}

// Instantiate Object
const book1 = new Book("Book One", "John Doe", 2013);
Book.topBookStores();

// Subclass - Magazine
class Magazine extends Book {
  constructor(title, author, year, month) {
    super(title, author, year);
    this.month = month;
  }
}

const mag1 = new Magazine("Mag One", "John Doe", "2018", "Jan");
console.log("mag1.getSummay() :>> ", mag1.getSummay());
