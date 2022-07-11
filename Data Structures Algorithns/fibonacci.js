const fibonacci = [1, 2]

let upto = 20

for (let i = 2; i < upto; i++) {
    fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
}

console.log(fibonacci)

