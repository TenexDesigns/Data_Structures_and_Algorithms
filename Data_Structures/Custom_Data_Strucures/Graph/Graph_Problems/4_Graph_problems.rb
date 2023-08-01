Sure! Here are some common problems that can be solved using graph data structures and algorithms, along with code samples in JavaScript:

1. Shortest Path in a Weighted Graph (Dijkstra's Algorithm):

Dijkstra's algorithm finds the shortest path from a source vertex to all other vertices in a weighted graph with non-negative edge weights.

```javascript
class Graph {
  // Graph implementation code here

  dijkstrasAlgorithm(startVertex) {
    const distances = new Map();
    const visited = new Set();
    const priorityQueue = new PriorityQueue();

    for (const vertex of this.adjacencyList.keys()) {
      distances.set(vertex, Infinity);
    }

    distances.set(startVertex, 0);
    priorityQueue.enqueue(startVertex, 0);

    while (!priorityQueue.isEmpty()) {
      const { vertex: currentVertex, priority: currentDistance } =
        priorityQueue.dequeueMin();

      if (!visited.has(currentVertex)) {
        visited.add(currentVertex);

        for (const neighbor of this.adjacencyList.get(currentVertex)) {
          const edgeWeight = this.getWeight(currentVertex, neighbor);
          const totalDistance = currentDistance + edgeWeight;

          if (totalDistance < distances.get(neighbor)) {
            distances.set(neighbor, totalDistance);
            priorityQueue.enqueue(neighbor, totalDistance);
          }
        }
      }
    }

    return distances;
  }
}
```

2. Depth-First Search (DFS) to Detect Cycles in a Directed Graph:

DFS can be used to detect cycles in a directed graph. If we encounter a back edge during DFS, then the graph contains a cycle.

```javascript
class Graph {
  // Graph implementation code here

  hasCycle() {
    const visited = new Set();
    const recursionStack = new Set();

    const hasCycleHelper = (vertex) => {
      visited.add(vertex);
      recursionStack.add(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          if (hasCycleHelper(neighbor)) {
            return true;
          }
        } else if (recursionStack.has(neighbor)) {
          return true;
        }
      }

      recursionStack.delete(vertex);
      return false;
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        if (hasCycleHelper(vertex)) {
          return true;
        }
      }
    }

    return false;
  }
}
```

3. Topological Sorting in a Directed Acyclic Graph (DAG):

Topological sorting arranges the vertices of a DAG in a linear order such that for every directed edge uv, vertex u comes before v in the ordering.

```javascript
class Graph {
  // Graph implementation code here

  topologicalSort() {
    const visited = new Set();
    const stack = [];

    const topologicalSortHelper = (vertex) => {
      visited.add(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          topologicalSortHelper(neighbor);
        }
      }

      stack.unshift(vertex);
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        topologicalSortHelper(vertex);
      }
    }

    return stack;
  }
}
```

These are just a few examples of problems that can be solved using graph data structures and algorithms. Graph algorithms are widely used in various applications such as network routing, social network analysis, dependency resolution, and more. The choice of algorithm depends on the specific problem and the characteristics of the graph.
