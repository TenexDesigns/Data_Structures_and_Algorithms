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



  
