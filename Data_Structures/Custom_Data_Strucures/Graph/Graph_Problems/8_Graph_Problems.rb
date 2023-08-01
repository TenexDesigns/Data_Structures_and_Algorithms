Sure! Here are some more problems solved using graph data structures and algorithms along with code samples in JavaScript:

1. Topological Sorting (Directed Acyclic Graph - DAG):

Topological sorting is used to find a linear ordering of vertices in a directed acyclic graph such that for every directed edge (u, v), vertex u comes before vertex v in the ordering.

```javascript
class Graph {
  // Graph implementation code here

  topologicalSort() {
    const visited = new Set();
    const stack = [];

    const dfsHelper = (vertex) => {
      visited.add(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          dfsHelper(neighbor);
        }
      }

      stack.unshift(vertex);
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        dfsHelper(vertex);
      }
    }

    return stack;
  }
}
```

2. Dijkstra's Shortest Path Algorithm (Single Source Shortest Path):

Dijkstra's algorithm finds the shortest path from a single source vertex to all other vertices in a weighted graph.

```javascript
class Graph {
  // Graph implementation code here

  dijkstraShortestPath(startVertex) {
    const distances = new Map();
    const previousVertexMap = new Map();
    const priorityQueue = new PriorityQueue();

    for (const vertex of this.adjacencyList.keys()) {
      distances.set(vertex, Infinity);
    }

    distances.set(startVertex, 0);
    priorityQueue.enqueue(startVertex, 0);

    while (!priorityQueue.isEmpty()) {
      const currentVertex = priorityQueue.dequeue().element;

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        const edgeWeight = this.getEdgeWeight(currentVertex, neighbor);
        const totalDistance = distances.get(currentVertex) + edgeWeight;

        if (totalDistance < distances.get(neighbor)) {
          distances.set(neighbor, totalDistance);
          previousVertexMap.set(neighbor, currentVertex);
          priorityQueue.enqueue(neighbor, totalDistance);
        }
      }
    }

    return { distances, previousVertexMap };
  }
}
```

3. Depth-First Search (DFS) for Cyclic Detection:

DFS can be used to detect cycles in a graph.

```javascript
class Graph {
  // Graph implementation code here

  isCyclic() {
    const visited = new Set();
    const recursiveStack = new Set();

    const dfsHelper = (vertex) => {
      visited.add(vertex);
      recursiveStack.add(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor) && dfsHelper(neighbor)) {
          return true;
        } else if (recursiveStack.has(neighbor)) {
          return true;
        }
      }

      recursiveStack.delete(vertex);
      return false;
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex) && dfsHelper(vertex)) {
        return true;
      }
    }

    return false;
  }
}
```

These are some additional problems that can be solved using graph data structures and algorithms. Graph algorithms have a wide range of applications, and these examples demonstrate a few of them. The efficiency of these algorithms depends on the size and complexity of the graph.

  
