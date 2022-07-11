#Example of a Factorial Function that calculates the factorial using recursive paradigm.


#Function to calculate Factorial of a Number using Recursive Paradigm
def recursiveFactorial(n):
    if n in (0,1):
        return 1
    else:
        return n * recursiveFactorial(n-1)


#Input Number to calculate Factorial of, then print the factorial:
print(f'Factorial: {recursiveFactorial(int(input("Enter number to calculate factorial of: ")))}')