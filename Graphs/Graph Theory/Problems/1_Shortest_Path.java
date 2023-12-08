Certainly! Here are a few graph-related questions along with sample solutions in TypeScript:

#### Question 1: Shortest Path

**Problem:** Given a weighted, directed graph, find the shortest path from a source vertex to a destination vertex.

```typescript
// Sample Solution:
class Graph {
  adjacencyList: Map<number, { vertex: number; weight: number }[]> = new Map();

  addEdge(source: number, destination: number, weight: number) {
    if (!this.adjacencyList.has(source)) {
      this.adjacencyList.set(source, []);
    }
    this.adjacencyList.get(source)!.push({ vertex: destination, weight });
  }

  shortestPath(source: number, destination: number): number[] {
    const distances: Map<number, number> = new Map();
    const previous: Map<number, number | null> = new Map();
    const priorityQueue = new PriorityQueue<number>();

    // Initialization
    this.adjacencyList.forEach((neighbors, vertex) => {
      distances.set(vertex, vertex === source ? 0 : Infinity);
      previous.set(vertex, null);
      priorityQueue.enqueue(vertex, distances.get(vertex)!);
    });

    while (!priorityQueue.isEmpty()) {
      const currentVertex = priorityQueue.dequeue()!;
      if (currentVertex === destination) {
        const path: number[] = [];
        let current = destination;
        while (current !== null) {
          path.unshift(current);
          current = previous.get(current)!;
        }
        return path;
      }

      this.adjacencyList.get(currentVertex)!.forEach((neighbor) => {
        const potentialDistance = distances.get(currentVertex)! + neighbor.weight;
        if (potentialDistance < distances.get(neighbor.vertex)!) {
          distances.set(neighbor.vertex, potentialDistance);
          previous.set(neighbor.vertex, currentVertex);
          priorityQueue.enqueue(neighbor.vertex, potentialDistance);
        }
      });
    }

    return [];
  }
}

// Example usage:
const graph = new Graph();
graph.addEdge(1, 2, 7);
graph.addEdge(1, 3, 9);
graph.addEdge(1, 6, 14);
graph.addEdge(2, 3, 10);
graph.addEdge(2, 4, 15);
graph.addEdge(3, 4, 11);
graph.addEdge(3, 6, 2);
graph.addEdge(4, 5, 6);
graph.addEdge(5, 6, 9);

const shortestPath = graph.shortestPath(1, 5);
console.log(shortestPath); // Output: [1, 3, 6, 5]
```

#### Question 2: Depth-First Search (DFS)

**Problem:** Implement depth-first search on an undirected graph.

```typescript
// Sample Solution:
class Graph {
  adjacencyList: Map<number, number[]> = new Map();

  addEdge(vertex1: number, vertex2: number) {
    if (!this.adjacencyList.has(vertex1)) {
      this.adjacencyList.set(vertex1, []);
    }
    if (!this.adjacencyList.has(vertex2)) {
      this.adjacencyList.set(vertex2, []);
    }
    this.adjacencyList.get(vertex1)!.push(vertex2);
    this.adjacencyList.get(vertex2)!.push(vertex1);
  }

  dfs(startVertex: number, visited: Set<number> = new Set()): number[] {
    const result: number[] = [];
    const stack: number[] = [startVertex];
    visited.add(startVertex);

    while (stack.length > 0) {
      const currentVertex = stack.pop()!;
      result.push(currentVertex);

      this.adjacencyList.get(currentVertex)!.forEach((neighbor) => {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          stack.push(neighbor);
        }
      });
    }

    return result;
  }
}

// Example usage:
const graph = new Graph();
graph.addEdge(1, 2);
graph.addEdge(1, 3);
graph.addEdge(2, 4);
graph.addEdge(2, 5);
graph.addEdge(3, 6);

const dfsResult = graph.dfs(1);
console.log(dfsResult); // Output: [1, 3, 6, 2, 5, 4]
```

These examples cover two common types of graph-related problems: finding the shortest path in a weighted directed graph and performing depth-first search on an undirected graph. You can modify and extend these solutions to address various graph-related challenges.
