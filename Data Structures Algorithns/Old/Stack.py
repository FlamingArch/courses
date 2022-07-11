class Node:
    def __init__(self,data):
        self.data = data
        self.next = None
    def __str__(self):
        return str(self.data)
        
class Stack:
    def __init__(self):
        self.top = None
        self.count = 0
    
    def push(self, data):
        node = Node(data)
        if self.top:
            node.next = self.top
        self.top = node
        self.count+=1
    
    def peek(self):
        return self.top
        
    def pop(self):
        node = self.top
        self.top = self.top.next
        return node

s = Stack()
s.push(1)
s.push(2)
s.push(3)
print(s.peek())
print(s.pop())
print(s.pop())
print(s.pop())        