class Node:
    def __init__(data):
        self.data = data
        self.next = None
    def __str__():
        return self.data
        
class Stack:
    def __init__():
        self.top = None
        self.count = 0
    
    def push(data):
        node = Node(data)
        if self.top:
            node.next = self.top
        self.top = node
        self.count+=1
    
    def peek():
        return self.top
        
    def pop():
        node = self.top
        self.top = self.top.next
        return node

s = Stack()
s.push(1)
s.push(2)
s.push(3)
print(s.pop())
print(s.pop())
print(s.pop())        