from Stack import Stack

# Doesn't Work Yet
def bracket_pair(string):
    stack = Stack()
    for c in string:
        if c in ["[", "{", "("]:
            stack.push(c)
        else:
            if stack.pop() == c:
                continue
            return False
    return True


print("Matching: ", bracket_pair(str(input('Enter Brackets: > '))))
