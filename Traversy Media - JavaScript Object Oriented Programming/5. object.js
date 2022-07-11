// Object of Protos
const bookProtos = {
  getSummary: function () {
    return `${this.title} was written by ${this.author} in ${this.year}`;
  },
  getAge: function () {
    const years = new Date().getFullYear() - this.year;
    return `${this.title} is ${years} years old`;
  },
};

const book1 = Object.create(bookProtos);
book1.title = "Book One";
book1.author = "John Doe";
book1.year = 2013;

// Or

const book2 = Object.create(bookProtos, {
  title: { value: "Book One" },
  author: { value: "John Doe" },
  year: { value: 2013 },
});

// console.log("book1 :>> ", book1);
console.log("book2 :>> ", book2);
