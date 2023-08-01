Sure! Here are some more problems and tasks solved using queues or algorithms along with code samples and their applications:

1. Breadth-First Search (BFS) in Graphs:
Problem: Traverse a graph in breadth-first order, visiting all the vertices level by level.

Code Sample:
```javascript
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
    this.adjacencyList.get(vertex1).push(vertex2);
    this.adjacencyList.get(vertex2).push(vertex1);
  }

  bfs(startVertex) {
    const visited = new Set();
    const queue = [startVertex];
    visited.add(startVertex);

    while (queue.length) {
      const currentVertex = queue.shift();
      console.log(currentVertex);

      this.adjacencyList.get(currentVertex).forEach((neighbor) => {
        if (!visited.has(neighbor)) {
          queue.push(neighbor);
          visited.add(neighbor);
        }
      });
    }
  }
}

// Example usage:
const graph = new Graph();
graph.addVertex("A");
graph.addVertex("B");
graph.addVertex("C");
graph.addVertex("D");

graph.addEdge("A", "B");
graph.addEdge("A", "C");
graph.addEdge("B", "D");
graph.addEdge("C", "D");

graph.bfs("A");
// Output: A B C D (Traversal order)
```

Application: BFS is used to find the shortest path between two vertices in an unweighted graph, web crawling, and network broadcasting.

2. Queue-based Asynchronous Task Processing:
Problem: Implement a system to process asynchronous tasks in a queue-based manner, ensuring that tasks are executed in order and efficiently.

Code Sample (Using JavaScript `setTimeout` for simulation):
```javascript
class TaskQueue {
  constructor() {
    this.queue = [];
    this.isProcessing = false;
  }

  enqueueTask(task) {
    this.queue.push(task);
    if (!this.isProcessing) {
      this.processQueue();
    }
  }

  processQueue() {
    if (this.queue.length === 0) {
      this.isProcessing = false;
      return;
    }

    const task = this.queue.shift();
    this.isProcessing = true;

    // Simulate asynchronous task execution
    setTimeout(() => {
      console.log("Executing task:", task);
      this.processQueue(); // Move to the next task
    }, 1000);
  }
}

// Example usage:
const taskQueue = new TaskQueue();
taskQueue.enqueueTask("Task 1");
taskQueue.enqueueTask("Task 2");
taskQueue.enqueueTask("Task 3");
// Output: Executing task: Task 1
//         Executing task: Task 2
//         Executing task: Task 3
```

Application: Queue-based task processing is used in handling background jobs, message queuing systems, and handling asynchronous operations efficiently.

3. Queue Reversal:
Problem: Reverse the elements of a queue using another queue.

Code Sample:
```javascript
function reverseQueue(queue) {
  const reversedQueue = [];
  while (queue.length > 0) {
    reversedQueue.unshift(queue.shift());
  }
  return reversedQueue;
}

// Example usage:
const originalQueue = [1, 2, 3, 4, 5];
const reversedQueue = reverseQueue(originalQueue);
console.log(reversedQueue);
// Output: [5, 4, 3, 2, 1]
```

Application: Queue reversal is used in reversing the order of elements in a queue for various applications.

4. Hot Potato Game Simulation:
Problem: Implement a simulation of the Hot Potato game using a queue, where players pass the "hot potato" around until the game ends.

Code Sample:
```javascript
function hotPotatoGame(players, num) {
  const queue = players;
  while (queue.length > 1) {
    for (let i = 0; i < num; i++) {
      queue.push(queue.shift());
    }
    console.log(`Player ${queue.shift()} is out!`);
  }
  return `The winner is Player ${queue[0]}`;
}

// Example usage:
const players = ["Alice", "Bob", "Carol", "Dave", "Eve"];
const num = 3;
console.log(hotPotatoGame(players, num));
// Output: Player Dave is out!
//         Player Bob is out!
//         Player Carol is out!
//         Player Alice is out!
//         The winner is Player Eve
```

Application: The Hot Potato game simulation can be used for educational purposes and as a fun interactive game.

These are just a few examples of problems and tasks that can be solved using queues or algorithms. Queues are versatile data structures with various applications in computer science, such as process scheduling, task management, and breadth-first search algorithms.





