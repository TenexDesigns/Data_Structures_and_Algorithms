Sure! Here are some more problems solved using graph data structures and algorithms along with code samples in JavaScript:

4. Breadth-First Search (BFS) to Find Shortest Path in Unweighted Graph:

BFS can be used to find the shortest path in an unweighted graph.

```javascript
class Graph {
  // Graph implementation code here

  bfsShortestPath(startVertex, targetVertex) {
    const visited = new Set();
    const queue = [];
    const previousVertexMap = new Map();

    queue.push(startVertex);
    visited.add(startVertex);

    while (queue.length) {
      const currentVertex = queue.shift();

      if (currentVertex === targetVertex) {
        return this.reconstructPath(previousVertexMap, targetVertex);
      }

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        if (!visited.has(neighbor)) {
          queue.push(neighbor);
          visited.add(neighbor);
          previousVertexMap.set(neighbor, currentVertex);
        }
      }
    }

    return null; // No path found
  }

  reconstructPath(previousVertexMap, targetVertex) {
    const path = [];
    let currentVertex = targetVertex;

    while (previousVertexMap.has(currentVertex)) {
      path.unshift(currentVertex);
      currentVertex = previousVertexMap.get(currentVertex);
    }

    path.unshift(currentVertex);
    return path;
  }
}
```

5. Connected Components in an Undirected Graph:

Connected components are disjoint subgraphs in an undirected graph where each vertex is reachable from every other vertex in the same component.

```javascript
class Graph {
  // Graph implementation code here

  connectedComponents() {
    const visited = new Set();
    const components = [];

    const dfsHelper = (vertex, component) => {
      visited.add(vertex);
      component.push(vertex);

      for (const neighbor of this.adjacencyList.get(vertex)) {
        if (!visited.has(neighbor)) {
          dfsHelper(neighbor, component);
        }
      }
    };

    for (const vertex of this.adjacencyList.keys()) {
      if (!visited.has(vertex)) {
        const component = [];
        dfsHelper(vertex, component);
        components.push(component);
      }
    }

    return components;
  }
}
```

6. Minimum Spanning Tree (Kruskal's Algorithm):

Kruskal's algorithm finds the minimum spanning tree of a connected, undirected graph with weighted edges.

javascript
class Graph {
  // Graph implementation code here

  kruskalsMST() {
    const sortedEdges = this.getAllEdges().sort((a, b) => a.weight - b.weight);
    const mst = new Graph();

    for (const vertex of this.adjacencyList.keys()) {
      mst.addVertex(vertex);
    }

    for (const edge of sortedEdges) {
      if (!mst.hasEdge(edge.vertex1, edge.vertex2)) {
        mst.addEdge(edge.vertex1, edge.vertex2, edge.weight);
      }

      if (mst.isCyclic()) {
        mst.removeEdge(edge.vertex1, edge.vertex2);
      }
    }

    return mst;
  }
}
```

These are just a few more examples of problems that can be solved using graph data structures and algorithms. Graphs are versatile data structures that have numerous applications in various fields, including network analysis, route planning, scheduling, and more. The choice of algorithm depends on the specific problem and the properties of the graph.

