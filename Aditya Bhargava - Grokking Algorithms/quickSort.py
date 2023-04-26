from random import randint
# Quicksort is a Divide and Conquer Algorithm


def quicksort(array):
    if len(array) < 2:
        return array

    else:
        # randomPivot = randint(0, len(array) - 1)
        pivot = array[0]
        less = [i for i in array[1:] if i <= pivot]
        greater = [i for i in array[1:] if i > pivot]

        return quicksort(less) + [pivot] + quicksort(greater)


print(quicksort([32, 21, 4, 87, 4, 87, 43]))
