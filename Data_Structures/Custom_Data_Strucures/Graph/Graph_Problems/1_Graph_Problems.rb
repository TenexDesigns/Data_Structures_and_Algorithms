Graph data structures and algorithms are used to solve various problems in computer science and real-world applications. Here are some examples of problems that can be solved using graphs along with code samples in JavaScript:

1. Shortest Path Problem (Dijkstra's Algorithm):

The shortest path problem aims to find the shortest path between two nodes in a weighted graph. Dijkstra's algorithm is commonly used to solve this problem.

```javascript
class Graph {
  // Graph implementation code here

  dijkstra(startVertex) {
    const distances = new Map();
    const visited = new Set();
    const priorityQueue = new PriorityQueue();

    for (const vertex of this.adjacencyList.keys()) {
      distances.set(vertex, Infinity);
    }

    distances.set(startVertex, 0);
    priorityQueue.enqueue(startVertex, 0);

    while (!priorityQueue.isEmpty()) {
      const [currentVertex, currentDistance] = priorityQueue.dequeue();

      if (visited.has(currentVertex)) continue;

      visited.add(currentVertex);

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        const distance = currentDistance + neighbor.weight;

        if (distance < distances.get(neighbor.vertex)) {
          distances.set(neighbor.vertex, distance);
          priorityQueue.enqueue(neighbor.vertex, distance);
        }
      }
    }

    return distances;
  }
}
```

2. Depth-First Search (DFS):

DFS is a graph traversal algorithm that explores as far as possible along each branch before backtracking.

```javascript
class Graph {
  // Graph implementation code here

  dfs(startVertex) {
    const visited = new Set();
    const result = [];

    const dfsHelper = (vertex) => {
      visited.add(vertex);
      result.push(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          dfsHelper(neighbor);
        }
      }
    };

    dfsHelper(startVertex);
    return result;
  }
}
```

3. Breadth-First Search (BFS):

BFS is a graph traversal algorithm that explores all the vertices of a graph in breadth-first order.

```javascript
class Graph {
  // Graph implementation code here

  bfs(startVertex) {
    const visited = new Set();
    const result = [];
    const queue = [startVertex];

    visited.add(startVertex);

    while (queue.length > 0) {
      const currentVertex = queue.shift();
      result.push(currentVertex);

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
    }

    return result;
  }
}
```

4. Topological Sorting:

Topological sorting is used to linearly order the vertices of a directed acyclic graph (DAG) based on their dependencies.

```javascript
class Graph {
  // Graph implementation code here

  topologicalSort() {
    const result = [];
    const visited = new Set();

    const dfsHelper = (vertex) => {
      visited.add(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          dfsHelper(neighbor);
        }
      }

      result.unshift(vertex);
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        dfsHelper(vertex);
      }
    }

    return result;
  }
}
```

These are just a few examples of how graph data structures and algorithms can be used to solve various problems. Graphs are powerful data structures that find applications in various domains like networking, social networks, recommendation systems, route planning, and more. The choice of the specific graph algorithm depends on the problem requirements and the characteristics of the graph.

  
