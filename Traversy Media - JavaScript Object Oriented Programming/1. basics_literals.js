// object.property
// object.meathod()

// Almost everything is an object, except primitives
// But you can still use methods on primitives.
const s1 = "Hello";
console.log(s1.toUpperCase());
console.log(typeof s1);

const s2 = new String("Hello");
console.log(typeof s2);

// DOM Objects
// console.log('window :>> ', window);

// Since Window is the topmost element, you can omit it
// window.alert(1)
// Same as
// alert(1)

// console.log('navigator.appVersion :>> ', navigator.appVersion);

// Object Literal
const book1 = {
  title: "Book 1",
  author: "John Doe",
  year: "2013",
  getSummary: function () {
    return `${this.title} was written by ${this.author} in ${this.year}`;
  },
};

console.log(book1.getSummary());
console.log(Object.values(book1));

