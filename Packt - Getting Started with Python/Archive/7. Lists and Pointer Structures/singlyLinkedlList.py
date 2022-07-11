class Node:
    def __init__(self, data=None):
        self.data = data
        self.next = None

    def __str__(self):
        return str(data)


class SinglyLinkedlList:

    def __init__(self):
        self.tail = None
        self.size = 0

    def iter(self):
        current = self.head
        while current!= self.head:
            val = current.data
            current = current.next
            yield val

    def append(self, data):
        node = Node(data)
        if self.head:
            self.head.next = node
            self.head = node
        else:
            self.tail = node
            self.head = node
        self.size += 1

    def size(self):
        count = 0
        current = self.tail
        while current:
            count += 1
            current = current.next
        return count

    def iter(self):
        current = self.tail
        while current:
            val = current.data
            current = current.next
            yield val

    def delete(self, data):
        current = self.tail
        prev = self.tail
        while current:
            if current.data == data:
                if current == self.tail:
                    self.tail == current.next
                else:
                    prev.next = current.next
                self.size -= 1
                return
            prev = current
            current = current.next

    def search(self, data):
        for node in self.iter():
            if data == node:
                return True
        return False

    def clear(self):
        self.tail = None
        self.head = None


words = SinglyLinkedlList()
words.append('eggs')
words.append('ham')
words.append('spam')

current = words.tail
while current:
    print(current.data)
    current = current.next

for word in words.iter:
    print(word)
