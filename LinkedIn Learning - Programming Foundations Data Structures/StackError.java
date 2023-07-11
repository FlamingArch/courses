import java.util.Stack;

public class StackError {
  public static void main(String[] args) {
    Stack<String> myStack = new Stack<>();
    myStack.push("hi");
    myStack.pop();
    myStack.pop();
  }
}
