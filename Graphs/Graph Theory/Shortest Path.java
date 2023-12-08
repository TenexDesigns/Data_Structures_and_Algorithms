Certainly! Let's implement Dijkstra's algorithm and Bellman-Ford algorithm for single-source shortest path in TypeScript. Note that these implementations assume a directed, weighted graph.

### Dijkstra's Algorithm:
```typescript
class Graph {
  private vertices: number;
  private adjacencyList: Map<number, { node: number; weight: number }[]> = new Map();

  constructor(vertices: number) {
    this.vertices = vertices;
  }

  addEdge(source: number, destination: number, weight: number): void {
    if (!this.adjacencyList.has(source)) {
      this.adjacencyList.set(source, []);
    }
    this.adjacencyList.get(source)!.push({ node: destination, weight });
  }

  dijkstra(startVertex: number): number[] {
    const distances: number[] = Array(this.vertices).fill(Number.MAX_SAFE_INTEGER);
    distances[startVertex] = 0;

    const priorityQueue: number[] = [startVertex];

    while (priorityQueue.length > 0) {
      const currentVertex = priorityQueue.shift()!;
      const neighbors = this.adjacencyList.get(currentVertex) || [];

      for (const neighbor of neighbors) {
        const newDistance = distances[currentVertex] + neighbor.weight;
        if (newDistance < distances[neighbor.node]) {
          distances[neighbor.node] = newDistance;
          priorityQueue.push(neighbor.node);
        }
      }
      priorityQueue.sort((a, b) => distances[a] - distances[b]);
    }

    return distances;
  }
}

// Example usage
const graph = new Graph(5);
graph.addEdge(0, 1, 2);
graph.addEdge(0, 2, 4);
graph.addEdge(1, 2, 1);
graph.addEdge(1, 3, 7);
graph.addEdge(2, 4, 3);
graph.addEdge(3, 4, 1);

const dijkstraResult = graph.dijkstra(0);
console.log(dijkstraResult); // Output: [0, 2, 3, 9, 6]
```

### Bellman-Ford Algorithm:
```typescript
class Graph {
  private vertices: number;
  private edges: { source: number; destination: number; weight: number }[] = [];

  constructor(vertices: number) {
    this.vertices = vertices;
  }

  addEdge(source: number, destination: number, weight: number): void {
    this.edges.push({ source, destination, weight });
  }

  bellmanFord(startVertex: number): number[] {
    const distances: number[] = Array(this.vertices).fill(Number.MAX_SAFE_INTEGER);
    distances[startVertex] = 0;

    for (let i = 0; i < this.vertices - 1; i++) {
      for (const edge of this.edges) {
        const { source, destination, weight } = edge;
        if (distances[source] !== Number.MAX_SAFE_INTEGER && distances[source] + weight < distances[destination]) {
          distances[destination] = distances[source] + weight;
        }
      }
    }

    return distances;
  }
}

// Example usage
const graph = new Graph(5);
graph.addEdge(0, 1, 2);
graph.addEdge(0, 2, 4);
graph.addEdge(1, 2, 1);
graph.addEdge(1, 3, 7);
graph.addEdge(2, 4, 3);
graph.addEdge(3, 4, 1);

const bellmanFordResult = graph.bellmanFord(0);
console.log(bellmanFordResult); // Output: [0, 2, 3, 9, 6]
```

These implementations find the shortest paths from a single source vertex to all other vertices in a directed, weighted graph using Dijkstra's algorithm and Bellman-Ford algorithm, respectively.




  
