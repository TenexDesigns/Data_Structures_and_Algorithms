Queues are a fundamental data structure used to solve various problems and tasks that involve managing elements in a first-in-first-out (FIFO) manner. Below are some common problems and tasks that can be efficiently solved using queues along with code samples:

1. Breadth-First Search (BFS):
BFS is an algorithm for traversing or searching tree or graph data structures level by level. It uses a queue to keep track of nodes to be visited in a specific order.

javascript
class Graph {
  // Graph implementation here
}

function bfs(graph, startNode) {
  const visited = new Set();
  const queue = [];
  queue.push(startNode);
  visited.add(startNode);

  while (queue.length > 0) {
    const currentNode = queue.shift();
    console.log(currentNode); // Process the current node
    for (const neighbor of graph.getNeighbors(currentNode)) {
      if (!visited.has(neighbor)) {
        queue.push(neighbor);
        visited.add(neighbor);
      }
    }
  }
}


2. Task Scheduling:
Task scheduling problems can be efficiently solved using a queue. For example, consider a scenario where tasks need to be executed in a specific order.

javascript
class TaskScheduler {
  constructor() {
    this.queue = new Queue();
  }

  addTask(task) {
    this.queue.enqueue(task);
  }

  executeTasks() {
    while (!this.queue.isEmpty()) {
      const task = this.queue.dequeue();
      task.execute(); // Execute the task
    }
  }
}

class Task {
  constructor(name) {
    this.name = name;
  }

  execute() {
    console.log(`Executing task: ${this.name}`);
  }
}

const task1 = new Task("Task 1");
const task2 = new Task("Task 2");
const task3 = new Task("Task 3");

const taskScheduler = new TaskScheduler();
taskScheduler.addTask(task1);
taskScheduler.addTask(task2);
taskScheduler.addTask(task3);

taskScheduler.executeTasks();


3. Printing Binary Tree Level by Level:
Printing a binary tree level by level can be done using a queue to traverse the tree in a BFS manner.

javascript
class BinaryTreeNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

function printBinaryTreeLevelByLevel(root) {
  if (!root) return;

  const queue = [];
  queue.push(root);

  while (queue.length > 0) {
    const levelSize = queue.length;
    for (let i = 0; i < levelSize; i++) {
      const node = queue.shift();
      console.log(node.value); // Print node value
      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }
  }
}

// Example usage:
const root = new BinaryTreeNode(1);
root.left = new BinaryTreeNode(2);
root.right = new BinaryTreeNode(3);
root.left.left = new BinaryTreeNode(4);
root.left.right = new BinaryTreeNode(5);

printBinaryTreeLevelByLevel(root);


These are just a few examples of how queues can be used to solve problems and perform tasks efficiently. Queues are a powerful data structure for managing elements in a FIFO order and finding solutions to various real-world scenarios.

