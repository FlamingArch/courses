import java.util.LinkedList;

public class LinkedListLibrary {
  public static void main(String[] args) {
    // Add Items
    LinkedList<String> travelBucketList = new LinkedList<>();
    travelBucketList.add("Santorini, Greece");
    travelBucketList.addFirst("Barcelona, Spain");
    travelBucketList.addLast("Tokyo, Japan");
    travelBucketList.add(2, "Galapagos Islands, Ecuador");
    System.out.println(travelBucketList);

    // Access
    System.out.println(travelBucketList.get(2));
    System.out.println(travelBucketList.getFirst()); // Lot more efficient

    // Search
    System.out.println(travelBucketList.contains("Barcelona, Spain")); // Computationally Expensive

    // Remove Items
    travelBucketList.removeFirst();
    travelBucketList.removeLast();
    System.out.println(travelBucketList);
  }
}
