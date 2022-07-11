class Array:
    def __init__(self, capacity=16):
        if capacity < 0:
            raise Exception("Illegal Capacity: " + capacity)
        self._arr = []
        self._len = 0
        self._capacity = capacity

    def size(self): return self._len

    def is_empty(self): return self.size() == 0

    def get(self, index): return self.arr[index]

    def set(self, index, element): self.arr[index] = element

    def add(elem):
        if len+1 >= capacity

    def removeAt(int rm_index):

