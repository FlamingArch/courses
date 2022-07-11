def selection_sort(arr):
    for i in range(len(arr)):
        min, pos = arr[i], i
        for j in range(i+1,len(arr)):
            if arr[j] < min:
                min, pos = arr[j], j
        if not arr[i] == min:
            arr[i], arr[pos] = arr[pos], arr[i]
    return arr