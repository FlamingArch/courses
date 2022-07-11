class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next


class LinkedList:
    def __init__(self):
        self.head = None
        self.size = 0

    def append(self, data):
        node = Node(data)
        if self.head:
            current = self.head
            while current.next:
                current = current.next
            current.next = node
        else:
            self.head = node
        self.size += 1

    def display(self,seperator=',', newLine=True):
        current = self.head
        while current:
            print(current.data,end=seperator)
            current = current.next
        if newLine: print()

    def delete(self, data):
        if self.head.data == data:
            self.head = self.head.next
            self.size -= 1
        else:
            current = self.head
            while current.next:
                if current.next.data == data:
                    current.next = current.next.next
                    self.size -= 1
                    break
                current = current.next

    def insert(self, data, index):
        node = Node(data)
        current = self.head
        for _ in range(index):
            current = current.next
        node.next = current.next
        current.next = node
    
    def search(self, data):
        current = self.head
        while current:
            if current.data == data: return True
            current = current.next
        return False
    def sort(self):
        while True:
            current = self.head
            while current.next:
                if current.data > current.next.data:
                    current.data, current.next.data = current.next.data, current.data
                    break
                current = current.next
            else:
                break

linkedList = LinkedList()
linkedList.append(3)
linkedList.append(1)
linkedList.append(4)
linkedList.append(5)
linkedList.append(2)
linkedList.display()

linkedList.delete(3)
linkedList.insert(12,2)
linkedList.delete(1)
linkedList.display()

print("Sorting:")
linkedList.sort()
linkedList.display()

print(linkedList.search(int(input("Enter Element to Search For: > "))))
