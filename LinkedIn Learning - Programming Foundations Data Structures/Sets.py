primaryColors = set(["red", "yellow", "blue"])

color = "green"

if color.lower() in primaryColors:
    print(f"{color} is a primary color")
else:
    print(f"{color} is not a primary color")

letters = set(["a", "b"])
letters.add("c")
print(letters)

