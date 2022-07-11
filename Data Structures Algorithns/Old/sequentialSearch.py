def sequentialSearch(arr, e):
    """
    Performs Sequential/Linear Search 

    Best Case: O(1) (The first element is the searched term)

    Worst Case: O(n) (The element searched is at last position, or doesn't exist in array)
    """
    for i in range(len(arr)):
        if arr[i]==e:
            return i
    else:
        return None

from random import randint
a = [randint(0,100) for _ in range(100)]
print(a)
e = int(input("Enter Number to Search For: > "))
pos = sequentialSearch(a,e)
if pos:
    print(f"Element at Position: {pos}")
else:
    print('Element not found!')

