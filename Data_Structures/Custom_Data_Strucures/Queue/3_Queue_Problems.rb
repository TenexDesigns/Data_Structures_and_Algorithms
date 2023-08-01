Sure! Here are some more problems and tasks that can be efficiently solved using queues along with code samples:

4. Implementing a Binary Tree Level Order Traversal with Zigzag Order:
In addition to a normal level order traversal, we can also perform a zigzag order traversal in a binary tree, where we alternate between left-to-right and right-to-left at each level.

```javascript
class TreeNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

function zigzagLevelOrder(root) {
  if (!root) return [];

  const result = [];
  const queue = [];
  queue.push(root);
  let isLeftToRight = true;

  while (queue.length > 0) {
    const levelSize = queue.length;
    const currentLevel = [];
    
    for (let i = 0; i < levelSize; i++) {
      const node = queue.shift();
      if (isLeftToRight) {
        currentLevel.push(node.value);
      } else {
        currentLevel.unshift(node.value);
      }

      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }
    
    result.push(currentLevel);
    isLeftToRight = !isLeftToRight;
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

console.log(zigzagLevelOrder(root)); // Output: [[1], [3, 2], [4, 5, 6, 7]]
```

5. Implementing a First Non-Repeating Character in a String:
Given a string, we need to find the first non-repeating character using a queue.

```javascript
function firstNonRepeatingCharacter(s) {
  const charMap = new Map();
  const queue = [];

  for (const char of s) {
    charMap.set(char, (charMap.get(char) || 0) + 1);
    queue.push(char);
    while (queue.length > 0 && charMap.get(queue[0]) > 1) {
      queue.shift();
    }
  }

  return queue.length > 0 ? queue[0] : null;
}

// Example usage:
const str = "aabccde";
console.log(firstNonRepeatingCharacter(str)); // Output: "b"
```

6. Implementing a Task Scheduler:
Given a list of tasks represented by characters, and a cooldown period, we need to find the minimum time needed to execute all the tasks. The cooldown period indicates that between two same tasks, there must be at least that many units of time.

```javascript
function taskScheduler(tasks, cooldown) {
  const taskMap = new Map();
  let time = 0;

  for (const task of tasks) {
    if (taskMap.has(task) && time - taskMap.get(task) < cooldown) {
      time = taskMap.get(task) + cooldown + 1;
    }

    taskMap.set(task, time);
    time++;
  }

  return time;
}

// Example usage:
const tasks = ["A", "B", "A", "C", "B", "D"];
const cooldown = 2;
console.log(taskScheduler(tasks, cooldown)); // Output: 8
```

These are some additional problems and tasks that demonstrate how queues and algorithms can be utilized to solve various scenarios efficiently. Queues are valuable data structures in solving problems that require first-in-first-out (FIFO) processing, and they have applications in a wide range of fields, including task scheduling, data processing, and graph traversals.
