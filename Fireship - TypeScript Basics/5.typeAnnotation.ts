// IMPLICIT TYPE ANNOTATION
var lucky = 12;
// lucky = 'W' // ERROR: String is not assignable to var of type Number.

// Opt out of typed system:
var lucky2: any = 10;
// Now it works just like vanilla JS

// Also:
let lucky3
lucky3 = 6
lucky3 = 'six'

// EXPLICIT TYPE ANNOTATION
var lucky4 : number
lucky4 = 4
// lucky4 = "four"    //ERROR