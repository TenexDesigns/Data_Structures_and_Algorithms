Sure! Here are some more problems and tasks that can be efficiently solved using queues along with code samples and their applications:

1. Task Scheduling and Job Sequencing:
Problem: Given a set of tasks with their execution times, we need to schedule them on multiple processors to minimize the total execution time.

Code Sample:
```javascript
function scheduleTasks(tasks, numProcessors) {
  const queue = Array.from({ length: numProcessors }, () => 0);

  for (const task of tasks) {
    const minProcessor = queue.reduce((minIdx, time, currIdx) => (time < queue[minIdx] ? currIdx : minIdx), 0);
    queue[minProcessor] += task;
  }

  return Math.max(...queue);
}

// Example usage:
const tasks = [3, 2, 5, 4, 1];
const numProcessors = 3;
console.log(scheduleTasks(tasks, numProcessors)); // Output: 7
```

Application: Task scheduling and job sequencing are common problems in parallel processing and resource allocation scenarios, such as scheduling tasks on a multi-core CPU or distributing jobs across multiple servers.

2. Binary Tree Level Order Traversal:
Problem: Given a binary tree, traverse it level by level and return the nodes at each level as separate arrays.

Code Sample:
```javascript
class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

function levelOrderTraversal(root) {
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
const root = new TreeNode(3);
root.left = new TreeNode(9);
root.right = new TreeNode(20);
root.right.left = new TreeNode(15);
root.right.right = new TreeNode(7);
console.log(levelOrderTraversal(root));
// Output: [[3], [9, 20], [15, 7]]
```

Application: Level order traversal is essential in various tree-based algorithms, such as finding the depth of a binary tree, finding the minimum depth, or performing any BFS-related operations on a tree.

3. Breadth-First Search in a Maze:
Problem: Given a maze represented as a 2D matrix, find the shortest path from the starting point to the destination using BFS.

Code Sample:
```javascript
function shortestPath(maze, start, destination) {
  const dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]];
  const queue = [start];
  const visited = new Set();

  while (queue.length) {
    const [x, y] = queue.shift();
    visited.add(`${x},${y}`);

    if (x === destination[0] && y === destination[1]) return true;

    for (const [dx, dy] of dirs) {
      let newX = x + dx;
      let newY = y + dy;

      while (newX >= 0 && newX < maze.length && newY >= 0 && newY < maze[0].length && maze[newX][newY] === 0) {
        newX += dx;
        newY += dy;
      }

      newX -= dx;
      newY -= dy;

      if (!visited.has(`${newX},${newY}`)) {
        queue.push([newX, newY]);
      }
    }
  }

  return false;
}

// Example usage:
const maze = [
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0],
  [1, 1, 0, 1, 1],
  [0, 0, 0, 0, 0],
];
const start = [0, 4];
const destination = [4, 4];
console.log(shortestPath(maze, start, destination)); // Output: true
```

Application: BFS is commonly used to explore and find the shortest path in graph-like structures, such as mazes, maps, or grid-based games.

These problems and tasks demonstrate the versatility and importance of queues and algorithms in various applications, including task scheduling, tree traversals, graph search, and maze-solving scenarios. Queues, with their first-in-first-out (FIFO) processing, are valuable tools in problem-solving, especially when a specific order of processing is required.



