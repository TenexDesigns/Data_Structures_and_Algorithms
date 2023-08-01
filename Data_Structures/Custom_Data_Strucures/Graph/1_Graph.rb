In JavaScript, a graph is a non-linear data structure that consists of a set of vertices (nodes) and a set of edges connecting these vertices.
  Trees are a specific type of graph data strcure
There is no hierachy in graph and there is no set way to read a graph

  Graphs can be used to represent various real-world relationships, such as social networks, transportation networks, and more.

Graphs can be categorized into two main types: directed graphs (digraphs) and undirected graphs. In directed graphs, edges have a direction, indicating a one-way relationship, while undirected graphs have symmetric relationships without any direction.


       Types of Graphs
    Bases On the characteriscit of their edges, graphs can be categorized into two types
        1.Directed grpahs
        2.Undirected Graphs
  


  Diarected graphs

  Is a graph in which the edges have a direction
  Edges are ususally represesnted by arrorwas pointing in the direction the graph can be traversed
  In this graph we can travers from A to B to C, but we can not travesr from C to B to A
  A--->B---->C


  
  Undirected Graph
  
  A graph in which the edges are bidirectional
  The graph can be traversed in either direction
  The absesnce of an arrow tells us that the graph is undirected
  Here we can trevaers from A to B to C, and we can also travers from C to B to A
  A---B----C
  
Methods and Operations of Graphs in JavaScript:

Add Vertex: To add a new vertex (node) to the graph.

Add Edge: To add a new edge between two vertices.

Remove Vertex: To remove a vertex and all its associated edges from the graph.

Remove Edge: To remove an edge between two vertices.

Get Neighbors: To get all the neighboring vertices of a given vertex.

Get Vertex Count: To get the total number of vertices in the graph.

Get Edge Count: To get the total number of edges in the graph.

Depth-First Search (DFS): To traverse the graph in a depth-first manner.

Breadth-First Search (BFS): To traverse the graph in a breadth-first manner.

Time Complexity of Graph Methods:

Add Vertex: O(1)
Add Edge: O(1)
Remove Vertex: O(|V| + |E|), where |V| is the number of vertices, and |E| is the number of edges.
Remove Edge: O(1)
Get Neighbors: O(|V|), where |V| is the number of vertices.
Get Vertex Count: O(1)
Get Edge Count: O(1)
DFS and BFS: O(|V| + |E|), where |V| is the number of vertices, and |E| is the number of edges.
JavaScript Implementation of Graph:

Below is a basic implementation of an undirected graph using an adjacency list representation:

javascript
Copy code
class Graph {
  constructor() {
    this.vertices = new Map();
  }

  addVertex(vertex) {
    if (!this.vertices.has(vertex)) {
      this.vertices.set(vertex, []);
    }
  }

  addEdge(vertex1, vertex2) {
    this.addVertex(vertex1);
    this.addVertex(vertex2);
    this.vertices.get(vertex1).push(vertex2);
    this.vertices.get(vertex2).push(vertex1);
  }

  removeVertex(vertex) {
    if (this.vertices.has(vertex)) {
      const neighbors = this.vertices.get(vertex);
      neighbors.forEach((neighbor) => {
        this.removeEdge(vertex, neighbor);
      });
      this.vertices.delete(vertex);
    }
  }

  removeEdge(vertex1, vertex2) {
    if (this.vertices.has(vertex1) && this.vertices.has(vertex2)) {
      const neighbors1 = this.vertices.get(vertex1);
      const neighbors2 = this.vertices.get(vertex2);
      this.vertices.set(
        vertex1,
        neighbors1.filter((neighbor) => neighbor !== vertex2)
      );
      this.vertices.set(
        vertex2,
        neighbors2.filter((neighbor) => neighbor !== vertex1)
      );
    }
  }

  getNeighbors(vertex) {
    return this.vertices.get(vertex) || [];
  }

  vertexCount() {
    return this.vertices.size;
  }

  edgeCount() {
    let count = 0;
    this.vertices.forEach((neighbors) => {
      count += neighbors.length;
    });
    return count / 2; // Divide by 2 since each edge is counted twice in the adjacency list.
  }

  dfs(startVertex, visited = new Set()) {
    if (!this.vertices.has(startVertex)) return;
    console.log(startVertex);
    visited.add(startVertex);
    for (const neighbor of this.vertices.get(startVertex)) {
      if (!visited.has(neighbor)) {
        this.dfs(neighbor, visited);
      }
    }
  }

  bfs(startVertex) {
    if (!this.vertices.has(startVertex)) return;
    const queue = [startVertex];
    const visited = new Set([startVertex]);

    while (queue.length > 0) {
      const vertex = queue.shift();
      console.log(vertex);
      for (const neighbor of this.vertices.get(vertex)) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
    }
  }
}

// Example usage:
const myGraph = new Graph();
myGraph.addEdge('A', 'B');
myGraph.addEdge('A', 'C');
myGraph.addEdge('B', 'C');
myGraph.addEdge('B', 'D');
myGraph.addVertex('E');

console.log(myGraph.getNeighbors('B')); // Output: [ 'A', 'C', 'D' ]
console.log(myGraph.vertexCount()); // Output: 5
console.log(myGraph.edgeCount()); // Output: 4

myGraph.dfs('A'); // Output: A B C D
myGraph.bfs('A'); // Output: A B C D
In the example above, we implemented a basic undirected graph using an adjacency list representation. The graph provides methods for adding vertices, adding edges, removing vertices and edges, getting neighbors, and traversing the graph using depth-first search (DFS) and breadth-first search (BFS). The time complexity of these methods is generally O(1) or O(|V| + |E|), where |V| is the number of vertices, and |E| is the number of edges.







  ....
