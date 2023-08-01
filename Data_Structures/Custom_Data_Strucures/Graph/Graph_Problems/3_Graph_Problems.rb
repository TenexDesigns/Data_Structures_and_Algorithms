Sure! Here are some common problems that can be solved using graph data structures and algorithms, along with code samples in JavaScript:

1. Breadth-First Search (BFS):

BFS is used to traverse a graph level by level, starting from a given source vertex. It can be used to find the shortest path in an unweighted graph.

```javascript
class Graph {
  // Graph implementation code here

  breadthFirstSearch(startVertex) {
    const queue = [];
    const visited = new Set();
    const traversalOrder = [];

    queue.push(startVertex);
    visited.add(startVertex);

    while (queue.length !== 0) {
      const currentVertex = queue.shift();
      traversalOrder.push(currentVertex);

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        if (!visited.has(neighbor)) {
          queue.push(neighbor);
          visited.add(neighbor);
        }
      }
    }

    return traversalOrder;
  }
}
```

2. Depth-First Search (DFS):

DFS is used to traverse a graph deeply, exploring as far as possible along each branch before backtracking. It can be used to find connected components and cycles in a graph.

```javascript
class Graph {
  // Graph implementation code here

  depthFirstSearch(startVertex) {
    const visited = new Set();
    const traversalOrder = [];

    const dfsHelper = (vertex) => {
      visited.add(vertex);
      traversalOrder.push(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          dfsHelper(neighbor);
        }
      }
    };

    dfsHelper(startVertex);
    return traversalOrder;
  }
}
```

3. Shortest Path in an Unweighted Graph:

Find the shortest path from a source vertex to all other vertices in an unweighted graph using BFS.

```javascript
class Graph {
  // Graph implementation code here

  shortestPathUnweightedGraph(startVertex) {
    const queue = [];
    const visited = new Set();
    const distance = new Map();

    queue.push(startVertex);
    visited.add(startVertex);
    distance.set(startVertex, 0);

    while (queue.length !== 0) {
      const currentVertex = queue.shift();

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        if (!visited.has(neighbor)) {
          queue.push(neighbor);
          visited.add(neighbor);
          distance.set(neighbor, distance.get(currentVertex) + 1);
        }
      }
    }

    return distance;
  }
}
```

4. Minimum Spanning Tree (Prim's Algorithm):

Find the minimum spanning tree of a connected, undirected graph using Prim's algorithm.

```javascript
class Graph {
  // Graph implementation code here

  primMST() {
    const visited = new Set();
    const mst = new Graph();
    const queue = new PriorityQueue();

    // Pick a starting vertex
    const startVertex = this.adjacencyList.keys().next().value;
    queue.enqueue(startVertex, 0);

    while (!queue.isEmpty()) {
      const { vertex, priority } = queue.dequeueMin();

      if (!visited.has(vertex)) {
        visited.add(vertex);

        // Add the vertex to the minimum spanning tree
        if (mst.adjacencyList.size > 0) {
          const parentVertex = mst.adjacencyList.keys().next().value;
          mst.addEdge(parentVertex, vertex);
        }

        for (const neighbor of this.adjacencyList.get(vertex)) {
          if (!visited.has(neighbor)) {
            queue.enqueue(neighbor, priority + 1); // Assuming the graph has positive edge weights
          }
        }
      }
    }

    return mst;
  }
}
```

These are just a few examples of problems that can be solved using graph data structures and algorithms. Graph algorithms are widely used in various applications such as network analysis, route planning, recommendation systems, and more. The choice of algorithm depends on the specific problem and the characteristics of the graph.
