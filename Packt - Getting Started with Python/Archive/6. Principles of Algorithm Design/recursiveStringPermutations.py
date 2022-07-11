#This program is an example of using a Function based on
#recursive paradigm that returns all possible permutations of a string.

#This function returns a list of all possible permutations of string s
#of length n, generating them by a recursive backtrackting model.
#Each character returned when n=1 is added to the set of characters present in the previous set.

def bitStr(n, s):
    if n==1: return s
    return [digit + bits for digit in bitStr(1,s)for bits in bitStr(n-1,s)]

print(bitStr(3, 'abc'))