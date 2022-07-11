// JavaScript Object Notation (JSON)
// Lightweight, Language-independent and user readable 
// data exchange format.
// It uses two types of data structures: Named-Value pairs ({name1:value1, name2:value2, ...}) and Ordered lists ([item1, item2...]).
// Values are separated by commas.

// Object:
var book = {
    title : 'Becoming',
    author : 'Michelle Obama',
    isAvailable: true
}

// Converting Object into JSON:
const bookJSON = JSON.stringify(book)
console.log('bookJSON :>> ', bookJSON);

// Converting JSON into Object:
const bookObj = JSON.parse(bookJSON)
console.log('bookObj :>> ', bookObj);
