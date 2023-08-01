Sure! Here are some more problems and tasks that can be efficiently solved using queues along with code samples and their applications:

1. Priority Queue Implementation:
Problem: Implement a priority queue, where elements are dequeued based on their priority. Elements with higher priority are dequeued before elements with lower priority.

Code Sample:
```javascript
class PriorityQueue {
  constructor() {
    this.queue = [];
  }

  enqueue(item, priority) {
    this.queue.push({ item, priority });
    this.queue.sort((a, b) => b.priority - a.priority);
  }

  dequeue() {
    if (this.isEmpty()) {
      return console.log("Priority queue is empty. Cannot dequeue.");
    }
    return this.queue.pop().item;
  }

  isEmpty() {
    return this.queue.length === 0;
  }

  getSize() {
    return this.queue.length;
  }
}

// Example usage:
const priorityQueue = new PriorityQueue();
priorityQueue.enqueue("Task 1", 3);
priorityQueue.enqueue("Task 2", 1);
priorityQueue.enqueue("Task 3", 2);

while (!priorityQueue.isEmpty()) {
  console.log("Dequeued task:", priorityQueue.dequeue());
}
// Output: Dequeued task: Task 1
//         Dequeued task: Task 3
//         Dequeued task: Task 2
```

Application: Priority queues are used in various scenarios, such as scheduling tasks in real-time systems, network packet scheduling, and Dijkstra's algorithm for finding the shortest path in a weighted graph.

2. Implementing LRU (Least Recently Used) Cache using Queue and Hash Map:
Problem: Implement a cache that stores a fixed number of items and removes the least recently used item when the cache is full and a new item is to be added.

Code Sample:
```javascript
class LRUCache {
  constructor(capacity) {
    this.capacity = capacity;
    this.queue = [];
    this.cacheMap = new Map();
  }

  get(key) {
    if (this.cacheMap.has(key)) {
      // Move the accessed key to the end of the queue
      const index = this.queue.indexOf(key);
      this.queue.splice(index, 1);
      this.queue.push(key);
      return this.cacheMap.get(key);
    }
    return -1;
  }

  put(key, value) {
    if (this.cacheMap.has(key)) {
      // Update the value of an existing key
      this.cacheMap.set(key, value);
      // Move the key to the end of the queue
      const index = this.queue.indexOf(key);
      this.queue.splice(index, 1);
      this.queue.push(key);
    } else {
      if (this.queue.length === this.capacity) {
        // Remove the least recently used key
        const lruKey = this.queue.shift();
        this.cacheMap.delete(lruKey);
      }
      // Add the new key to the end of the queue
      this.queue.push(key);
      this.cacheMap.set(key, value);
    }
  }
}

// Example usage:
const cache = new LRUCache(3);
cache.put("A", 10);
cache.put("B", 20);
cache.put("C", 30);
console.log(cache.get("A")); // Output: 10
cache.put("D", 40);
console.log(cache.get("B")); // Output: -1 (B is removed from the cache)
```

Application: LRUCache is commonly used in web caching, database caching, and cache eviction policies to optimize performance by keeping frequently accessed items in memory.

3. Implementing Breadth-First Search (BFS) on a Binary Tree:
Problem: Perform BFS on a binary tree and visit all the nodes level by level.

Code Sample:
```javascript
class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

function bfsBinaryTree(root) {
  if (!root) return [];

  const result = [];
  const queue = [root];

  while (queue.length) {
    const levelSize = queue.length;
    const currentLevel = [];

    for (let i = 0; i < levelSize; i++) {
      const node = queue.shift();
      currentLevel.push(node.val);

      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }

    result.push(currentLevel);
  }

  return result;
}

// Example usage:
const root = new TreeNode(1);
root.left = new TreeNode(2);
root.right = new TreeNode(3);
root.left.left = new TreeNode(4);
root.left.right = new TreeNode(5);
root.right.left = new TreeNode(6);
root.right.right = new TreeNode(7);
console.log(bfsBinaryTree(root));
// Output: [[1], [2, 3], [4, 5, 6, 7]]
```

Application: BFS on a binary tree is used in various

 tree-related tasks, such as level-order traversal, finding the shortest path between two nodes, and exploring the tree level by level.

These examples showcase how queues and algorithms are used to solve various problems, including priority-based tasks, caching, and tree traversals. Queues provide an essential data structure for efficiently managing elements and prioritizing operations based on different criteria.


..
