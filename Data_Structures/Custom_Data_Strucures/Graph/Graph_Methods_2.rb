Sure, lets go through an implementation of a graph data structure in JavaScript and explain its various methods, how they function, and their time complexities.

javascript
class Graph {
  constructor() {
    this.adjacencyList = new Map();
  }

  addVertex(vertex) {
    if (!this.adjacencyList.has(vertex)) {
      this.adjacencyList.set(vertex, []);
    }
  }

  addEdge(vertex1, vertex2) {
    if (!this.adjacencyList.has(vertex1) || !this.adjacencyList.has(vertex2)) {
      throw new Error("Both vertices should exist in the graph.");
    }

    this.adjacencyList.get(vertex1).push(vertex2);
    this.adjacencyList.get(vertex2).push(vertex1);
  }

  hasEdge(vertex1, vertex2) {
    if (!this.adjacencyList.has(vertex1) || !this.adjacencyList.has(vertex2)) {
      return false;
    }

    return this.adjacencyList.get(vertex1).includes(vertex2);
  }

  display() {
    for (const [vertex, edges] of this.adjacencyList) {
      console.log(`${vertex} -> ${edges.join(", ")}`);
    }
  }

  removeEdge(vertex1, vertex2) {
    if (this.adjacencyList.has(vertex1)) {
      this.adjacencyList.set(
        vertex1,
        this.adjacencyList.get(vertex1).filter((v) => v !== vertex2)
      );
    }

    if (this.adjacencyList.has(vertex2)) {
      this.adjacencyList.set(
        vertex2,
        this.adjacencyList.get(vertex2).filter((v) => v !== vertex1)
      );
    }
  }

  removeVertex(vertex) {
    if (!this.adjacencyList.has(vertex)) {
      throw new Error("Vertex does not exist in the graph.");
    }

    for (const connectedVertex of this.adjacencyList.get(vertex)) {
      this.removeEdge(vertex, connectedVertex);
    }

    this.adjacencyList.delete(vertex);
  }
}


Explanation of methods:

1. `constructor()`: Initializes the graph with an empty adjacency list using a Map.

2. `addVertex(vertex)`: Adds a new vertex to the graph. It checks if the vertex is not already present in the adjacency list and adds it with an empty array to represent its connections (edges).

3. `addEdge(vertex1, vertex2)`: Adds an edge between two vertices in the graph. If the vertices are not already present in the adjacency list, it throws an error. It adds `vertex2` to the adjacency list of `vertex1`, and vice versa, representing a bidirectional edge.

4. `hasEdge(vertex1, vertex2)`: Checks if there is an edge between two vertices in the graph. It verifies that both vertices exist in the adjacency list and checks if `vertex2` is present in the array of `vertex1`s connections.

5. `display()`: Displays the adjacency list representation of the graph.

6. `removeEdge(vertex1, vertex2)`: Removes an edge between two vertices in the graph. It removes `vertex2` from the array of vertex1s connections, and vice versa.

7. `removeVertex(vertex)`: Removes a vertex from the graph. It first removes all the edges associated with the vertex and then deletes the vertex from the adjacency list.

Time complexities:

- `addVertex(vertex)`: O(1) - The `set()` method of Map has an average time complexity of O(1) for insertion.

- `addEdge(vertex1, vertex2)`: O(1) - The `push()` method of an array has an average time complexity of O(1) for appending an element.

- `hasEdge(vertex1, vertex2)`: O(n) - The `includes()` method of an array has an average time complexity of O(n) for checking if an element exists.

- `display()`: O(V + E) - V is the number of vertices, and E is the number of edges. Displaying all the edges in the graph takes linear time.

- `removeEdge(vertex1, vertex2)`: O(n) - The `filter()` method of an array has an average time complexity of O(n) for filtering elements.

- `removeVertex(vertex)`: O(V + E) - V is the number of vertices, and E is the number of edges. Removing a vertex involves removing all its edges, which takes linear time.

The graph data structure is used to represent relationships and connections between entities in a wide range of applications, such as social networks, computer networks, routing algorithms, and more. It allows efficient storage and manipulation of graph-related information.




