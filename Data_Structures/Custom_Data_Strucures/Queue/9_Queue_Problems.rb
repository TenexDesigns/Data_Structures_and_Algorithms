Sure! Here are some more problems and tasks solved using queues or algorithms along with code samples and their applications:

1. Task Scheduling with Priority Queue:
Problem: Implement a task scheduling system that processes tasks based on their priority. Higher priority tasks should be executed before lower priority tasks.

Code Sample:
```javascript
class PriorityQueue {
  constructor() {
    this.queue = [];
  }

  enqueue(task, priority) {
    this.queue.push({ task, priority });
    this.queue.sort((a, b) => b.priority - a.priority);
  }

  dequeue() {
    if (this.isEmpty()) {
      return null;
    }
    return this.queue.pop().task;
  }

  isEmpty() {
    return this.queue.length === 0;
  }
}

// Example usage:
const priorityQueue = new PriorityQueue();
priorityQueue.enqueue("Task 1", 3);
priorityQueue.enqueue("Task 2", 1);
priorityQueue.enqueue("Task 3", 2);

console.log(priorityQueue.dequeue()); // Output: Task 2 (highest priority)
console.log(priorityQueue.dequeue()); // Output: Task 3
console.log(priorityQueue.dequeue()); // Output: Task 1 (lowest priority)
console.log(priorityQueue.isEmpty()); // Output: true
```

Application: Priority queues are used in task scheduling algorithms, such as in operating systems to manage processes based on their priority levels.

2. Implementing LRU Cache with Queue:
Problem: Implement a Least Recently Used (LRU) cache using a queue to efficiently manage and evict the least recently accessed items.

Code Sample:
```javascript
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
    } else {
      return -1;
    }
  }

  put(key, value) {
    if (this.cache.size >= this.capacity) {
      const evictedKey = this.queue.pop();
      this.cache.delete(evictedKey);
    }
    this.cache.set(key, value);
    this.queue.unshift(key);
  }
}

// Example usage:
const cache = new LRUCache(3);
cache.put("A", 1);
cache.put("B", 2);
cache.put("C", 3);

console.log(cache.get("A")); // Output: 1 (A is accessed and becomes the most recently used)
console.log(cache.get("B")); // Output: 2 (B is accessed and becomes the most recently used)
console.log(cache.get("C")); // Output: 3 (C is accessed and becomes the most recently used)

cache.put("D", 4); // Capacity reached, evicting the least recently used item "A"

console.log(cache.get("A")); // Output: -1 (A was evicted from the cache)
```

Application: LRU cache with a queue is used in systems where caching is needed to optimize data access and minimize expensive computations or database queries.

3. Binary Tree Level Order Traversal:
Problem: Perform a level-order traversal of a binary tree using a queue.

Code Sample:
```javascript
class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = this.right = null;
  }
}

function levelOrderTraversal(root) {
  if (!root) {
    return [];
  }

  const result = [];
  const queue = [root];

  while (queue.length) {
    const currentLevel = [];
    const size = queue.length;

    for (let i = 0; i < size; i++) {
      const node = queue.shift();
      currentLevel.push(node.val);

      if (node.left) {
        queue.push(node.left);
      }
      if (node.right) {
        queue.push(node.right);
      }
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

console.log(levelOrderTraversal(root));
// Output: [[1], [2, 3], [4, 5]]
```

Application: Level order traversal is used in binary tree algorithms like binary tree serialization and deserialization, finding the height of the tree, and solving problems that require traversing the tree level by level.

4. Print All Anagrams Together:
Problem: Given an array of strings, group anagrams together using a queue.

Code Sample:
```javascript
function groupAnagrams(strings) {
  const result = [];
  const map = new Map();

  for (const str of strings) {
    const sortedStr = str.split("").sort().join("");
    if (map.has(sortedStr)) {
      map.get(sortedStr).push(str);
    } else {
      map.set(sortedStr, [str]);
    }
  }

  for (const group of map.values()) {
    result.push(group);
  }

  return result;
}

// Example usage:
const inputStrings = ["eat", "tea", "tan", "ate", "nat", "bat"];
console.log(groupAnagrams(inputStrings));
// Output: [["eat","tea","ate"],["tan","nat"],["bat"]]
```

Application: Grouping anagrams together efficiently is useful in various scenarios, such as word grouping, spell-checking, and analyzing sets of words.

These are just a few examples of problems and tasks that can be solved using queues or algorithms. Queues and algorithms are fundamental tools in computer science and are widely used in various applications, ranging from data structures to solving complex problems efficiently.






  ... 
