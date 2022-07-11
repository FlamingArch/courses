// Objects
// - Real World are full of objects (Example: book, song, library, playlist)
// - Real Objects have associated attributes (Example: book title, book author,
//   book availability)
// - Real Objects have associated actions (Example: checkout the book from library)
// Similarly, for JavaScript Objects:
// - Representations of Real world Objects using Code
// - JavaScript Objects have associated properties
// - JavaScript Objects have associated methods
const book = {
    title: "1984",
    author: "George Orwell",
    isAvailable = false,
    checkIn: function() {
        this.isAvailable=true;
    },
    checkOut: function() {
        this.isAvailable=false;
    }
}
// console.log('typeof book :>> ', typeof book);

// Objects can also be created in other ways (Example: using 'new' with object or function constructor)
// Think of Constructors as 'templates'
// Create instances using the `new` keyword
// Object is the 'template' for a base or vanilla object
const book2 = new Object()
book2.title = "1984";
book2.author = "George Orwell";
book2.isAvailable = false;
book2.checkIn = function() {
    this.isAvailable = true;
};
book2.checkOut = function() {
    this.isAvailable = false;
}
console.log('typeof book2 :>> ', typeof book2);

// Properties have immutable names and mutable values

// Accessing Values:
// Method 1: Dot Notation
console.log('book.author :>> ', book.author);
// Method 2: Bracket Notation
console.log('book["title"] :>> ', book["title"]);

// `this` Keyword (context)
// Functions need access to runtime context
//   (Object) methods may need access to peer property values (standalone)
//   Functions may use global variables in execution
// `this` maps to relevant context at runtime
//   - FOR OBJECT METHODS: Maps to enclosing objects
//   - FOR STANDALONE FUNCTIONS: Maps to global object
//   May be undefined (strict mode) or changed (Example: use apply)
// About global object
//   - defaults to window in browser runtime
//   - defaults to global object in Node.js runtime
//   Use `globalThis` to reference the global object consistently