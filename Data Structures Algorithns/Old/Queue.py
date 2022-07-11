class Node:
    def __init__(self, data):
        self.data = data
        self.next = None
    def __str__(self):
        return str(self.data)
        
class Queue:
    def __init__(self):
        self.start = None
        self.count = 0
    def push(self, data):
        node = Node(data)
        if self.start:
            current = self.start
            while current.next:
                current = current.next
            current.next = node
        else:
            self.start = node
        self.count+=1
        
    def length(self):
        return self.count
    
    def peek(self):
        return self.start
        
    def pop(self):
        node = self.start
        self.start = self.start.next
        self.count -= 1
        return node

q = Queue()
q.push(1)
q.push(2)
q.push(3)
print(q.peek())
print(q.pop())
print(q.pop())
print(q.pop())
