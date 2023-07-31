func breadthFirstPrint(_ graph: [String: [String]], source: String) {
  var queue = [source]
  while queue.count > 0 {
    let current = queue.removeFirst()
    print(current)

    for neighbor in graph[current]! {
      queue.append(neighbor)
    }
  }
}

let graph = [
  "a": ["b", "c"],
  "b": ["d"],
  "c": ["e"],
  "d": ["f"],
  "e": [],
  "f": [],
]

breadthFirstPrint(graph, source: "a")
