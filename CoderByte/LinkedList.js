class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
  }

  print() {
    let str = ``;
    let current = this.head;
    while (current) {
      str += current.val + "->";
      current = current.next;
    }
    console.log(str);
  }

  contains(val) {
    let current = this.head;
    while (current) {
      if (val == current.val) return true;
      current = current.next;
    }
    return false;
  }

  append(val) {
    // If LinkedList is empty
    if (this.head == null) {
      this.head = new Node(val);
      return;
    }
    // If Linked List is not empty
    let current = this.head;
    while (current.next) {
      current = current.next;
    }
    current.next = new Node(val);
  }
}

const list = new LinkedList();
list.append("a");
list.append("b");
list.append("c");
list.append("d");
list.append(69);
// a -> b
list.print();

console.log(list.contains("a"));
console.log(list.contains("b"));
console.log(list.contains("c"));
console.log(list.contains("d"));
console.log(list.contains("x"));
console.log(list.contains("y"));
console.log(list.contains(69));
