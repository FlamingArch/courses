x = int(input("Enter x: > "))
y = int(input("Enter y: > "))

try:
    print(x/y)
except ZeroDivisionError as e:
    # Optionally, log e somewhere
    print('Sorry, something went wront')
except:
    print('Something really went wrong')
finally:
    print('This always runs on success or failure')
