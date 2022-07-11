class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class Stack:
    def __init__(self):
        self.top = None
    def push(self, data):
        node = Node(data)
        if self.top:
            node.next = self.top
            self.top = node
        else:
            self.top = node
    def pop(self):
        if self.top:
            node = self.top
            self.top = self.top.next
            return node
        else: raise Exception("Empty Node")

