func depthFirstPrint(_ graph: [String: [String]], source: String) {
  var stack = [source]
  while stack.count > 0 {
    let source = stack.popLast()
    print(source!)

    for neighbor in graph[source!]! {
      stack.append(neighbor)
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

depthFirstPrint(graph, source: "a")
