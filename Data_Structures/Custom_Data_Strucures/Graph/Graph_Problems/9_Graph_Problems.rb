Sure! Here are some common problems solved using graph data structures and algorithms along with code samples in JavaScript:

1. Breadth-First Search (BFS) - Shortest Path:

BFS can be used to find the shortest path between two vertices in an unweighted graph.

```javascript
class Graph {
  // Graph implementation code here

  bfsShortestPath(startVertex, endVertex) {
    const queue = [];
    const visited = new Set();
    const previousVertexMap = new Map();

    queue.push(startVertex);
    visited.add(startVertex);

    while (queue.length > 0) {
      const currentVertex = queue.shift();

      if (currentVertex === endVertex) {
        const path = [];
        let vertex = endVertex;

        while (vertex !== startVertex) {
          path.unshift(vertex);
          vertex = previousVertexMap.get(vertex);
        }

        path.unshift(startVertex);
        return path;
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
}
```

2. Connected Components in an Undirected Graph:

Connected components are groups of vertices in an undirected graph that are connected to each other but not connected to vertices in other groups.

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

3. Minimum Spanning Tree (MST) - Kruskal's Algorithm:

Kruskal's algorithm finds the minimum spanning tree in a weighted graph.

```javascript
class Graph {
  // Graph implementation code here

  kruskalMST() {
    const mstEdges = [];
    const sortedEdges = this.getSortedEdges();
    const disjointSet = new DisjointSet();

    for (const vertex of this.adjacencyList.keys()) {
      disjointSet.makeSet(vertex);
    }

    for (const edge of sortedEdges) {
      const [vertex1, vertex2, weight] = edge;

      if (!disjointSet.inSameSet(vertex1, vertex2)) {
        disjointSet.union(vertex1, vertex2);
        mstEdges.push(edge);
      }
    }

    return mstEdges;
  }
}
```

4. Shortest Path in Directed Acyclic Graph (DAG):

Topological sorting can be used to find the shortest path in a directed acyclic graph.

```javascript
class Graph {
  // Graph implementation code here

  shortestPathDAG(startVertex) {
    const stack = this.topologicalSort();
    const distances = new Map();

    for (const vertex of this.adjacencyList.keys()) {
      distances.set(vertex, Infinity);
    }

    distances.set(startVertex, 0);

    while (stack.length > 0) {
      const currentVertex = stack.pop();

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        const edgeWeight = this.getEdgeWeight(currentVertex, neighbor);
        const totalDistance = distances.get(currentVertex) + edgeWeight;

        if (totalDistance < distances.get(neighbor)) {
          distances.set(neighbor, totalDistance);
        }
      }
    }

    return distances;
  }
}
```

These are just a few examples of problems that can be solved using graph data structures and algorithms. Graphs are incredibly versatile and have numerous applications in various domains, such as network routing, social networks, recommendation systems, and more. The efficiency of these algorithms depends on the size and complexity of the graph.
