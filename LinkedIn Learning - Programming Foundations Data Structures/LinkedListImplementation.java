class LinkedListScratch {
  Node head;

  // Add data at the start of the linked list
  public void add(int data) {
    if (this.head == null) {
      this.head = new Node(data);
    } else {
      Node nodeToAdd = new Node(data);
      nodeToAdd.next = this.head;
      this.head = nodeToAdd;
    }
  }
}

class Node {
  int data;
  Node next;

  Node(int d) {
    this.data = d;
  }
}

public class LinkedListImplementation {
  public static void main(String[] args) {
    LinkedListScratch myList = new LinkedListScratch();
    myList.add(10);
    myList.add(18);
    System.out.println(myList.head.data);
    System.out.println(myList.head.next.data);
  }
}
