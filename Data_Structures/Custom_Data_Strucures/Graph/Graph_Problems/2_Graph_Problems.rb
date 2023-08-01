Sure! Here are some more problems that can be solved using graph data structures and algorithms, along with code samples in JavaScript:

1. Topological Sorting (Directed Acyclic Graphs - DAGs):

Find a linear ordering of vertices in a directed acyclic graph (DAG) such that for every directed edge (u, v), vertex u comes before v in the ordering.

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

      stack.push(vertex);
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        topologicalSortHelper(vertex);
      }
    }

    return stack.reverse();
  }
}
```

2. Shortest Path in a Weighted Graph (Dijkstra's Algorithm):

Find the shortest path from a source vertex to all other vertices in a weighted graph with non-negative edge weights using Dijkstra's algorithm.

```javascript
class Graph {
  // Graph implementation code here

  dijkstraShortestPath(sourceVertex) {
    const distance = new Map();
    const visited = new Set();

    for (const vertex of this.adjacencyList.keys()) {
      distance.set(vertex, Infinity);
    }

    distance.set(sourceVertex, 0);

    while (visited.size !== this.adjacencyList.size) {
      const currVertex = this.getMinDistanceVertex(distance, visited);
      visited.add(currVertex);

      for (const neighbor of this.adjacencyList.get(currVertex)) {
        const edgeWeight = this.getEdgeWeight(currVertex, neighbor);
        const totalDistance = distance.get(currVertex) + edgeWeight;

        if (totalDistance < distance.get(neighbor)) {
          distance.set(neighbor, totalDistance);
        }
      }
    }

    return distance;
  }

  getMinDistanceVertex(distance, visited) {
    let minDistance = Infinity;
    let minVertex = null;

    for (const [vertex, dist] of distance.entries()) {
      if (dist < minDistance && !visited.has(vertex)) {
        minDistance = dist;
        minVertex = vertex;
      }
    }

    return minVertex;
  }

  getEdgeWeight(vertex1, vertex2) {
    // Implement code to get the weight of the edge between vertex1 and vertex2
    // If the graph is unweighted, return 1 as the default weight.
  }
}
```

3. Strongly Connected Components in a Directed Graph (Kosaraju's Algorithm):

Find all strongly connected components in a directed graph using Kosaraju's algorithm.

```javascript
class Graph {
  // Graph implementation code here

  stronglyConnectedComponents() {
    const visited = new Set();
    const stack = [];

    const dfsHelper = (vertex) => {
      visited.add(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          dfsHelper(neighbor);
        }
      }

      stack.push(vertex);
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        dfsHelper(vertex);
      }
    }

    const reversedGraph = this.reverseGraph();
    visited.clear();
    const scc = [];

    const sccHelper = (vertex, component) => {
      visited.add(vertex);
      component.push(vertex);

      for (const neighbor of reversedGraph.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          sccHelper(neighbor, component);
        }
      }
    };

    while (stack.length > 0) {
      const vertex = stack.pop();
      if (!visited.has(vertex)) {
        const component = [];
        sccHelper(vertex, component);
        scc.push(component);
      }
    }

    return scc;
  }

  reverseGraph() {
    const reversedGraph = new Graph();

    for (const vertex of this.adjacencyList.keys()) {
      for (const neighbor of this.adjacencyList.get(vertex)) {
        reversedGraph.addEdge(neighbor, vertex);
      }
    }

    return reversedGraph;
  }
}
```

These are just a few more examples of problems that can be solved using graph data structures and algorithms. Graph algorithms are powerful and versatile tools used in various fields, such as network routing, social network analysis, data mining, and more. The specific algorithm to use depends on the problem's requirements and the characteristics of the graph.


