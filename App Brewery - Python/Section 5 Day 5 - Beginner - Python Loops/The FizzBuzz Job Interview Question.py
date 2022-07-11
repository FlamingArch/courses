def fizzbuzz(a):
    if a%3==0 and a%5==0:
        print('FizzBuzz')
    elif not a%3:
        print('Fizz')
    elif not a%5:
        print('Buzz')
    else:
        print(a)

for i in range(101):
    fizzbuzz(i)