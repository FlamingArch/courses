upto = int(input("Enter Limit: "))
prime = []

for i in range(2,upto+1):
    for divisor in range(2, i):
        if i%divisor==0:
            break
    else:
        prime.append(i)
        print(str(i) + ", ", end="")

print(prime)
