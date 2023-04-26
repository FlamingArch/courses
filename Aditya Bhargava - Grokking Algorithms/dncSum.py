
def sum(arr):
  if len(arr) == 0: return 0
  if len(arr) == 1: return arr[0]

  return arr[0] + sum(arr[1:])

print(sum([12,32,2,12,23]))
