import random
from math import (
    log10, ceil
)


def karatsuba(x, y):
    # The base case for recursion
    if x < 10 or y < 10:
        return x*y
    # Sets n, the number of digits in the highest input number
    n = max(int(log10(x)+1), int(log10(y)+1))
    # Rounds up to n/2
    n_2 = int(ceil(n/2.0))
    # Adds 1 if n is uneven
    n = n if n % 2 == 0 else n+1
    # Splits the input numbers
    a, b = divmod(x, 10**n_2)
    c, d = divmod(y, 10**n_2)
    # Applies the three recursive sets
    ac = karatsuba(a, c)
    bd = karatsuba(b, d)
    ad_bc = karatsuba((a+b), (c+d)) - ac - bd


def test():
    for i in range(1000):
        x = random.randint(1, 10**5)
        y = random.randint(1, 10**5)
        expected = x*y
        result = karatsuba(x,y)
        if result!=expected:
            return("Failed")
        return ("Ok")

print(test())