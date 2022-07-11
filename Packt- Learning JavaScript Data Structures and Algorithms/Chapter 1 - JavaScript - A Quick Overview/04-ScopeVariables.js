var myVariable = 'Global'
myOtherVariable = 'Globul'

function myFunction() {
    var myVariable = 'Local'
    return myVariable
}

function myOtherFunction() {
    myOtherVariable = 'Locul'
    return myOtherVariable
}

console.log(myVariable)
console.log(myFunction())
console.log(myOtherVariable)
console.log(myOtherFunction())
console.log(myOtherVariable)
