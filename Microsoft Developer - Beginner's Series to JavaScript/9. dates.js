// THE DATE OBJECT
// Time is just a construct (or object even) ;)

// Current Date and Time
const now = new Date()
console.log('now :>> ', now);

// The Date object stores time internally as a number of miliseconds
// since 1 Jan 1970

// Set a specific Date and Time
// WARNING: MONTH COUNTING STARTS FROM 0
const orignaliPhoneLaunch = new Date(2008,0,8,9,41,0)
const windows95Launch = new Date(1995, 7, 24)

// You can set values later and get single values using getDate(), 
// getMonth()... and setDate(), setMonth() etc getters and setters.
