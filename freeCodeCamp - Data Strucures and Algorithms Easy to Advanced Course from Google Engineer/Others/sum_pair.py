# Given a ascending order sorted List of Integers, Find all the pairs that sum up to a specific number

def my_solution():
    a = [int(i) for i in input("Enter List: > ").split(',')]
    s = int(input("Enter Sum: > "))

    pairs = {(i, j) for i in a for j in a if i + j == s}
    print(pairs if pairs else 'No Pairs Found')


def binary_search_solution():
    print("Considering Array is already sorted")
    raise NotImplementedError
