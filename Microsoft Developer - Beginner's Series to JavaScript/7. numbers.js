var num1 = '150'
// parseInt() and parseFloat()
// Converts Numerical Strings to Numbers
console.log(parseInt('50'))
console.log(parseInt(num1))
console.log(parseInt('0XF'))
// Adding Non-Numerical characters can have unintended causes.
console.log(parseInt('ABC'))

console.log(parseFloat('0.50'))
console.log(parseFloat(num1))
console.log(parseFloat('flo1'))
// Adding Non-Numerical characters can have unintended causes.
console.log(parseFloat('ABC'))

// toString()
// Converts numbers to numerical strings