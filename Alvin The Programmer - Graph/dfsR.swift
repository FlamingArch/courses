func depthFirstPrint(_ graph: [String: [String]], source: String) {
  print(source)
  for neighbor in graph[source]! {
    depthFirstPrint(graph, source: neighbor)
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
