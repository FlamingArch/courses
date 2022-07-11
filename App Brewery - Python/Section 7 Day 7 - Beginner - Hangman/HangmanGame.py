def printDashes(a, n=[], c2='-'):
    for i in range(len(a)):
        if i in n:
            print(a[i], end="")
        else:
            print(c2, end="")
            


print(header)

a = input("Word: > ").upper()
aCopy = a
movesLeft = 5
notFound = len(a)
foundIndcs = []

while True:
    printDashes(aCopy, foundIndcs)
    print(f"    |    Lives Left: {movesLeft}")
    inp = input("Enter Guess > ").upper()
    if not a.find(inp)==-1:
        foundIndcs.append(a.find(inp))
        a = a.strip(inp)

        notFound-=1
    else:
        movesLeft-=1
    print()
    print(f"DEBUG: {a}")
    if notFound==0:
        print("You found all!\nWord was '{a}'\n")
        break
    if movesLeft==0:
        print(f"You Lose!\nWord was '{a}'\n")

        break

