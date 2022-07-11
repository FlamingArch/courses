def mergeSort(A):
    # Base case if the input array is one or zero, just return.
    if len(A) > 1:
        # Splitting input array
        print('Splitting ', A)
        mid = len(A)//2
        left = A[:mid]
        right = A[mid:]
        mergeSort(left)
        mergeSort(right)
        i = j = k = 0
        while i < len(left) and j < len(right):
            # If left < right comparision operation
            if left[i] < right[j]:
                A[k] = left[i]
                i+=1
            else:
                A[k] = right[j]
                j+=1
            k+=1
        while i < len(left):
            # Assignment Operation
            A[k] = left[i]
            i+=1
            k+=1
        while j < len(right):
            # Assignment Operation
            A[k] = right[j]
            j+=1
            k+=1
    print('Merging ', A)
    return(A)

mergeSort([356, 97, 846, 215])