Sure! Here are some problems and tasks that can be efficiently solved using queues along with code samples:

1. Implementing a LRU (Least Recently Used) Cache:
LRU Cache is used to store a limited number of items and evict the least recently used item when the cache is full. A queue can be used to keep track of the order of item accesses, and when a new item is added or an existing item is accessed, it is moved to the front of the queue.

javascript
class LRUCache {
  constructor(capacity) {
    this.capacity = capacity;
    this.cache = new Map();
    this.queue = [];
  }

  get(key) {
    if (this.cache.has(key)) {
      const index = this.queue.indexOf(key);
      this.queue.splice(index, 1);
      this.queue.unshift(key);
      return this.cache.get(key);
    }
    return -1;
  }

  put(key, value) {
    if (this.cache.has(key)) {
      this.cache.set(key, value);
      const index = this.queue.indexOf(key);
      this.queue.splice(index, 1);
      this.queue.unshift(key);
    } else {
      if (this.queue.length === this.capacity) {
        const leastUsed = this.queue.pop();
        this.cache.delete(leastUsed);
      }
      this.cache.set(key, value);
      this.queue.unshift(key);
    }
  }
}

// Example usage:
const cache = new LRUCache(3);
cache.put(1, "Value 1");
cache.put(2, "Value 2");
cache.put(3, "Value 3");

console.log(cache.get(2)); // Output: "Value 2" (Item 2 accessed, moved to the front)
cache.put(4, "Value 4"); // Output: Item 1 evicted as the capacity is exceeded


2. Implementing a Breadth-First Search (BFS) in a Binary Tree:
BFS is an algorithm for traversing or searching tree data structures level by level. It can be implemented using a queue to store nodes to be visited in a specific order.

javascript
class BinaryTreeNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

function bfs(root) {
  if (!root) return;

  const queue = [];
  queue.push(root);

  while (queue.length > 0) {
    const node = queue.shift();
    console.log(node.value); // Process the current node

    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }
}

// Example usage:
const root = new BinaryTreeNode(1);
root.left = new BinaryTreeNode(2);
root.right = new BinaryTreeNode(3);
root.left.left = new BinaryTreeNode(4);
root.left.right = new BinaryTreeNode(5);

bfs(root); // Output: 1 2 3 4 5


3. Implementing a Level Order Traversal in a N-ary Tree:
Level Order Traversal is similar to BFS, but for N-ary trees where each node can have multiple children.

javascript
class NaryTreeNode {
  constructor(value) {
    this.value = value;
    this.children = [];
  }
}

function levelOrderTraversal(root) {
  if (!root) return;

  const queue = [];
  queue.push(root);

  while (queue.length > 0) {
    const levelSize = queue.length;
    for (let i = 0; i < levelSize; i++) {
      const node = queue.shift();
      console.log(node.value); // Process the current node
      for (const child of node.children) {
        queue.push(child);
      }
    }
  }
}

// Example usage:
const root = new NaryTreeNode(1);
const child1 = new NaryTreeNode(2);
const child2 = new NaryTreeNode(3);
const child3 = new NaryTreeNode(4);
root.children.push(child1, child2, child3);

levelOrderTraversal(root); // Output: 1 2 3 4


These are just a few examples of problems and tasks that can be solved using queues and algorithms. Queues are a versatile data structure and are widely used in solving various real-world scenarios, such as task scheduling, tree traversals, and caching.


  ..
