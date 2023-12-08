Certainly! Let's implement cycle detection for both directed and undirected graphs in TypeScript.

### Directed Graph Cycle Detection (DFS with Backtracking):
```typescript
class DirectedGraph {
  private vertices: number;
  private adjacencyList: Map<number, number[]> = new Map();

  constructor(vertices: number) {
    this.vertices = vertices;
  }

  addEdge(source: number, destination: number): void {
    if (!this.adjacencyList.has(source)) {
      this.adjacencyList.set(source, []);
    }
    this.adjacencyList.get(source)!.push(destination);
  }

  isCyclic(): boolean {
    const visited: boolean[] = Array(this.vertices).fill(false);
    const recursionStack: boolean[] = Array(this.vertices).fill(false);

    const hasCycle = (vertex: number): boolean => {
      visited[vertex] = true;
      recursionStack[vertex] = true;

      const neighbors = this.adjacencyList.get(vertex) || [];
      for (const neighbor of neighbors) {
        if (!visited[neighbor]) {
          if (hasCycle(neighbor)) {
            return true;
          }
        } else if (recursionStack[neighbor]) {
          return true;
        }
      }

      recursionStack[vertex] = false;
      return false;
    };

    for (let i = 0; i < this.vertices; i++) {
      if (!visited[i] && hasCycle(i)) {
        return true;
      }
    }

    return false;
  }
}

// Example usage
const directedGraph = new DirectedGraph(4);
directedGraph.addEdge(0, 1);
directedGraph.addEdge(0, 2);
directedGraph.addEdge(1, 2);
directedGraph.addEdge(2, 0);
directedGraph.addEdge(2, 3);
directedGraph.addEdge(3, 3);

const directedCycle = directedGraph.isCyclic();
console.log(directedCycle); // Output: true
```

### Undirected Graph Cycle Detection (DFS with Parent Tracking):
```typescript
class UndirectedGraph {
  private vertices: number;
  private adjacencyList: Map<number, number[]> = new Map();

  constructor(vertices: number) {
    this.vertices = vertices;
  }

  addEdge(vertex1: number, vertex2: number): void {
    if (!this.adjacencyList.has(vertex1)) {
      this.adjacencyList.set(vertex1, []);
    }
    this.adjacencyList.get(vertex1)!.push(vertex2);

    if (!this.adjacencyList.has(vertex2)) {
      this.adjacencyList.set(vertex2, []);
    }
    this.adjacencyList.get(vertex2)!.push(vertex1);
  }

  isCyclic(): boolean {
    const visited: boolean[] = Array(this.vertices).fill(false);

    const hasCycle = (vertex: number, parent: number): boolean => {
      visited[vertex] = true;

      const neighbors = this.adjacencyList.get(vertex) || [];
      for (const neighbor of neighbors) {
        if (!visited[neighbor]) {
          if (hasCycle(neighbor, vertex)) {
            return true;
          }
        } else if (neighbor !== parent) {
          return true;
        }
      }

      return false;
    };

    for (let i = 0; i < this.vertices; i++) {
      if (!visited[i] && hasCycle(i, -1)) {
        return true;
      }
    }

    return false;
  }
}

// Example usage
const undirectedGraph = new UndirectedGraph(3);
undirectedGraph.addEdge(

  
