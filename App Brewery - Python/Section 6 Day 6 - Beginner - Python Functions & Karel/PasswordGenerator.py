import random


letter = list("qwertyuiopasdfghjklzxcvbnm")
number = list("1234567890")
symbol = list("""!@#$%^&*?.,""")

letters = int(input("How many letters would you like in your password?\n"))
numbers = int(input("How many numbers would you like?\n"))
symbols = int(input("How many symbols would you like?\n"))

password = []

for i in range(letters):
    password.append(f"{letter[random.randint(0, len(letter)-1)]}")

for i in range(numbers):
    password.append(f"{number[random.randint(0, len(number)-1)]}")

for i in range(symbols):
    password.append(f"{symbol[random.randint(0, len(symbol)-1)]}")

random.shuffle(password)

passwordStr = ""

for i in password:
    passwordStr += i

print(f"Here is your password: {passwordStr}")
