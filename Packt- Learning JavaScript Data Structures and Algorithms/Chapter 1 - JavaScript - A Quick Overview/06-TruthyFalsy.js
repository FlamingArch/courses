function testTruthy(val) {
    val ? console.log('truthy') : console.log('falsy');
}

testTruthy(true)
testTruthy(false)
testTruthy(new Boolean(false))

testTruthy('')
testTruthy('Sample')
testTruthy(new String(''))

testTruthy(1)
testTruthy(-1)
testTruthy(NaN)
testTruthy(new Number(NaN))

testTruthy({})

obj = {name: 'John'}
testTruthy(obj)
testTruthy(obj.name)
testTruthy(obj.age)
