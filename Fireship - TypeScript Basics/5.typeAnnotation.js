// IMPLICIT TYPE ANNOTATION
var lucky = 12;
// lucky = 'W' // String is not assignable to var of type Number.
// Opt out of typed system:
var lucky2 = 10;
// Now it works just like vanilla JS
// Also:
var lucky3;
lucky3 = 6;
lucky3 = 'six';
// EXPLICIT TYPE ANNOTATION
var lucky4;
lucky4 = 4;
// lucky4 = "four"    //Error
