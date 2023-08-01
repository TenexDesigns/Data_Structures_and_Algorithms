Sure! Here are some more problems and tasks that can be efficiently solved using queues along with code samples:

1. Breadth-First Search (BFS) in a Graph:
BFS is an algorithm used to traverse or search in a graph data structure. It starts at the tree root (or any arbitrary node) and explores all the neighbor nodes at the present depth prior to moving on to nodes at the next depth level.

javascript
class Graph {
  constructor() {
    this.adjacencyList = new Map();
  }

  addVertex(vertex) {
    this.adjacencyList.set(vertex, []);
  }

  addEdge(vertex1, vertex2) {
    this.adjacencyList.get(vertex1).push(vertex2);
    this.adjacencyList.get(vertex2).push(vertex1);
  }

  bfs(startingNode) {
    const visited = new Set();
    const queue = [];

    visited.add(startingNode);
    queue.push(startingNode);

    while (queue.length > 0) {
      const currentVertex = queue.shift();
      console.log(currentVertex);

      for (const neighbor of this.adjacencyList.get(currentVertex)) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
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

graph.bfs("A");
// Output: A B C D


2. Implementing a Sliding Window Maximum:
Given an array of integers and a window size k, we need to find the maximum element for each window of size k using a queue.

javascript
function slidingWindowMax(nums, k) {
  const result = [];
  const deque = [];

  for (let i = 0; i < nums.length; i++) {
    while (deque.length > 0 && nums[i] >= nums[deque[deque.length - 1]]) {
      deque.pop();
    }

    deque.push(i);

    if (i >= k - 1) {
      result.push(nums[deque[0]]);
      if (deque[0] === i - k + 1) {
        deque.shift();
      }
    }
  }

  return result;
}

// Example usage:
const nums = [1, 3, -1, -3, 5, 3, 6, 7];
const k = 3;
console.log(slidingWindowMax(nums, k)); // Output: [3, 3, 5, 5, 6, 7]


3. Implementing a Task Scheduler with Shortest Interval:
Given a list of tasks represented by characters, and a non-negative integer n, we need to find the minimum time needed to finish all the tasks, such that the same tasks are at least n units apart.

javascript
function taskScheduler(tasks, n) {
  const taskCounts = new Map();
  for (const task of tasks) {
    taskCounts.set(task, (taskCounts.get(task) || 0) + 1);
  }

  const maxCount = Math.max(...taskCounts.values());
  let idleTime = (maxCount - 1) * n;

  for (const count of taskCounts.values()) {
    idleTime -= Math.min(count, maxCount - 1);
  }

  idleTime = Math.max(0, idleTime);

  return tasks.length + idleTime;
}

// Example usage:
const tasks = ["A", "A", "A", "B", "B", "C"];
const n = 2;
console.log(taskScheduler(tasks, n)); // Output: 8


These are some additional problems and tasks that demonstrate how queues and algorithms can be utilized to solve various scenarios efficiently. Queues are valuable data structures in solving problems that require first-in-first-out (FIFO) processing, and they have applications in a wide range of fields, including graph traversals, sliding window problems, and task scheduling.


