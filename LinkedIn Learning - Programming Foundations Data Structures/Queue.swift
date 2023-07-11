class Queue {
  var queueArray = [String]()

  // Push
  func enqueue(item: String) {
    self.queueArray.append(item)
  }

  // Pop
  func dequeue() -> String? {
    if self.queueArray.first != nil {
      let firstString = self.queueArray.first
      self.queueArray.removeFirst()
      return firstString!
    } else {
      return nil
    }
  }

  func peek() -> String? {
    if self.queueArray.first != nil {
      let firstString = self.queueArray.first
      return firstString!
    } else {
      return nil
    }
  }
}

var deck = Queue()

deck.enqueue(item: "Peggy")
deck.enqueue(item: "Larry")
deck.enqueue(item: "Serena")

print(deck.peek()!)
print(deck.peek()!)

var firstItemPopped = deck.dequeue()
print(deck.peek()!)
var secondItemPopped = deck.dequeue()
print(deck.peek()!)

print(firstItemPopped!)
print(secondItemPopped!)
