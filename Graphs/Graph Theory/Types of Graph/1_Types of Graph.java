Certainly! Below is an example implementation in TypeScript representing different types of graphs: Directed Graph (DiGraph), Undirected Graph, Weighted Graph, and Directed Acyclic Graph (DAG). I'll use an adjacency list representation for simplicity.

```typescript
class Graph {
  private vertices: number;
  private adjacencyList: Map<number, { neighbor: number; weight?: number }[]>;

  constructor(vertices: number) {
    this.vertices = vertices;
    this.adjacencyList = new Map<number, { neighbor: number; weight?: number }[]>();

    for (let i = 0; i < vertices; i++) {
      this.addVertex(i);
    }
  }

  addVertex(vertex: number): void {
    this.adjacencyList.set(vertex, []);
  }

  addEdge(source: number, destination: number, weight?: number): void {
    if (!this.adjacencyList.has(source) || !this.adjacencyList.has(destination)) {
      throw new Error('Invalid vertices');
    }

    const edge = { neighbor: destination, weight };
    this.adjacencyList.get(source)?.push(edge);
  }

  printGraph(): void {
    for (const [vertex, neighbors] of this.adjacencyList.entries()) {
      const neighborsString = neighbors
        .map(({ neighbor, weight }) => (weight ? `${neighbor}(${weight})` : `${neighbor}`))
        .join(', ');
      console.log(`${vertex} -> [${neighborsString}]`);
    }
  }
}

// Example usage for different types of graphs

// Directed Graph (DiGraph)
const diGraph = new Graph(4);
diGraph.addEdge(0, 1);
diGraph.addEdge(0, 2);
diGraph.addEdge(1, 2);
diGraph.addEdge(2, 0);
diGraph.addEdge(2, 3);
diGraph.addEdge(3, 3);

console.log('Directed Graph (DiGraph):');
diGraph.printGraph();
console.log('\n');

// Undirected Graph
const undirectedGraph = new Graph(4);
undirectedGraph.addEdge(0, 1);
undirectedGraph.addEdge(0, 2);
undirectedGraph.addEdge(1, 2);
undirectedGraph.addEdge(2, 3);

console.log('Undirected Graph:');
undirectedGraph.printGraph();
console.log('\n');

// Weighted Graph
const weightedGraph = new Graph(4);
weightedGraph.addEdge(0, 1, 2);
weightedGraph.addEdge(0, 2, 4);
weightedGraph.addEdge(1, 2, 1);
weightedGraph.addEdge(2, 3, 3);

console.log('Weighted Graph:');
weightedGraph.printGraph();
console.log('\n');

// Directed Acyclic Graph (DAG)
const dag = new Graph(4);
dag.addEdge(0, 1);
dag.addEdge(0, 2);
dag.addEdge(1, 2);
dag.addEdge(2, 3);

console.log('Directed Acyclic Graph (DAG):');
dag.printGraph();
```

This code defines a `Graph` class and demonstrates how to create instances of different types of graphs using the `addEdge` method. The `printGraph` method is used to display the adjacency list representation of each graph.




  
dfs and bfs for the above
---------------------------------------------------
  Certainly! Below is an example implementation of Depth-First Search (DFS) and Breadth-First Search (BFS) for graph traversal in TypeScript. In this example, I'm using the `Graph` class from the previous response:

```typescript
class Graph {
  // ... (same Graph class implementation as before)

  // Depth-First Search (DFS)
  dfs(startingVertex: number): void {
    const visited: Set<number> = new Set<number>();
    this.dfsRecursive(startingVertex, visited);
  }

  private dfsRecursive(vertex: number, visited: Set<number>): void {
    if (!visited.has(vertex)) {
      console.log(vertex);
      visited.add(vertex);

      const neighbors = this.adjacencyList.get(vertex) || [];
      for (const { neighbor } of neighbors) {
        this.dfsRecursive(neighbor, visited);
      }
    }
  }

  // Breadth-First Search (BFS)
  bfs(startingVertex: number): void {
    const visited: Set<number> = new Set<number>();
    const queue: number[] = [];

    visited.add(startingVertex);
    queue.push(startingVertex);

    while (queue.length > 0) {
      const currentVertex = queue.shift()!;
      console.log(currentVertex);

      const neighbors = this.adjacencyList.get(currentVertex) || [];
      for (const { neighbor } of neighbors) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
    }
  }
}

// Example usage for DFS and BFS

const graph = new Graph(5);
graph.addEdge(0, 1);
graph.addEdge(0, 2);
graph.addEdge(1, 3);
graph.addEdge(2, 4);

console.log('Depth-First Search (DFS):');
graph.dfs(0);
console.log('\n');

console.log('Breadth-First Search (BFS):');
graph.bfs(0);
```

This code demonstrates how to perform DFS and BFS traversal on a graph. The `dfs` method uses a recursive approach, while the `bfs` method uses an iterative approach with a queue. Both methods print the vertices in the order they are visited.


  
