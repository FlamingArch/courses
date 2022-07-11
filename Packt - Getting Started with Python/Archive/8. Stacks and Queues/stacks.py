class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class Stack:
    def __init__(self):
        self.top = None
        self.size = 0
    def push(self, data):
        node = Node(data)
        if self.top:
            node.next = self.top
            self.top = node
        else:
            self.top = node
        self.size += 1

    def peek(self):
        if self.top:
            return self.top.data
        else:
            return None

    def pop(self):
        if self.top!=None:
            data = self.top.data
            self.top = self.top.next
            self.size -= 1
            return data
        else:
            return None

def CheckBraket(statement):
    stack = Stack()
    for character in statement:
        if character in ('{', '[', '('):
            stack.push(character)
        if character in ('}', ']', ')'):
            last = stack.pop()
            if last=='(' and character == ')':
                continue
            elif last=='{' and character == '}':
                continue
            elif last=='[' and character == ']':
                continue
            else:
                return False
    if stack.size>0:
        return False
    else:
        return True

sl = [
    "{(foo)(bar)}[hello](((this)is)a)test",
    "{(foo)(bar)}[hello](((this)is)atest",
    "{(foo)(bar)}[hello](((this)is)a)test))",
]

for s in sl:
    m = CheckBraket(s)
    print("{}: {}".format(s,m))