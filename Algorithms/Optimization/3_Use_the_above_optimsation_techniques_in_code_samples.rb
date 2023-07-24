Sure, lets explore some practical examples of how to implement these optimization techniques in JavaScript for various problem tasks.


  
1.Memoization / Dynamic Programming:
  
Problem Task: Calculate the nth Fibonacci number.


// Using memoization (dynamic programming) to calculate Fibonacci numbers
function fib(n, memo = {}) {
  if (n in memo) return memo[n];
  if (n <= 2) return 1;

  memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
  return memo[n];
}

console.log(fib(5)); // Output: 5
console.log(fib(10)); // Output: 55
console.log(fib(20)); // Output: 6765
In this example, we are using memoization to store the previously computed Fibonacci numbers in the memo object. This avoids redundant calculations and significantly improves the efficiency of the function, especially for large values of n.


  
2.Sliding Window Technique:
  
Problem Task: Find the maximum sum of a subarray of a given size.

function maxSumSubarray(arr, k) {
  let maxSum = 0;
  let currentSum = 0;

  for (let i = 0; i < k; i++) {
    currentSum += arr[i];
  }

  maxSum = currentSum;

  for (let i = k; i < arr.length; i++) {
    currentSum = currentSum - arr[i - k] + arr[i];
    maxSum = Math.max(maxSum, currentSum);
  }

  return maxSum;
}

const arr = [2, 1, 5, 1, 3, 2];
const k = 3;
console.log(maxSumSubarray(arr, k)); // Output: 9 (Subarray: [5, 1, 3])
In this example, we are using the sliding window technique to efficiently calculate the maximum sum of a subarray of size k in an array arr. The approach involves maintaining a window of k elements and sliding it through the array while efficiently updating the current sum.




  
  
3.Greedy Algorithm:
  
Problem Task: Find the minimum number of coins to make a given amount of money.


function minCoins(coins, amount) {
  coins.sort((a, b) => b - a); // Sort coins in descending order
  let count = 0;

  for (let i = 0; i < coins.length; i++) {
    while (amount >= coins[i]) {
      amount -= coins[i];
      count++;
    }
  }

  return count;
}

const coins = [1, 5, 10, 25];
const amount = 47;
console.log(minCoins(coins, amount)); // Output: 5 (25 + 10 + 10 + 1 + 1)
In this example, we are using a greedy algorithm to find the minimum number of coins needed to make a given amount. The algorithm picks the largest denomination coin available at each step to reach the target amount.

These are just a few examples of how you can implement optimization techniques in JavaScript to improve the efficiency of algorithms. The choice of which technique to use depends on the specific problem and data constraints. Each optimization technique addresses different types of problems and can have a significant impact on the performance of the algorithm. When faced with a particular problem, analyze its requirements, data size, and constraints to determine the most suitable optimization strategy.





4.Problem Task: Longest Increasing Subsequence (LIS)
    
Find the length of the longest increasing subsequence in a given array.


// Using Dynamic Programming for LIS
function lengthOfLIS(nums) {
  if (nums.length === 0) return 0;

  const dp = new Array(nums.length).fill(1);

  for (let i = 1; i < nums.length; i++) {
    for (let j = 0; j < i; j++) {
      if (nums[i] > nums[j]) {
        dp[i] = Math.max(dp[i], dp[j] + 1);
      }
    }
  }

  return Math.max(...dp);
}

const nums = [10, 9, 2, 5, 3, 7, 101, 18];
console.log(lengthOfLIS(nums)); // Output: 4 (Longest increasing subsequence: [2, 3, 7, 101])
In this example, we are using dynamic programming to find the length of the longest increasing subsequence in the array nums. The dp array stores the length of the longest increasing subsequence ending at each index i.


    
5.Problem Task: Two Sum
    
Given an array of integers and a target sum, find two numbers in the array that add up to the target.


// Using Hashing (Two Sum Problem)
function twoSum(nums, target) {
  const numMap = {};

  for (let i = 0; i < nums.length; i++) {
    const complement = target - nums[i];
    if (numMap[complement] !== undefined) {
      return [numMap[complement], i];
    }
    numMap[nums[i]] = i;
  }

  return null;
}

const nums = [2, 7, 11, 15];
const target = 9;
console.log(twoSum(nums, target)); // Output: [0, 1] (nums[0] + nums[1] = 2 + 7 = 9)
In this example, we are using hashing (a JavaScript object) to solve the Two Sum problem. We traverse the array, and for each element, we check if its complement (target - current element) is present in the numMap. If it is, we found the two numbers that add up to the target.


    
6.Problem Task: Merge Sort
Implement the merge sort algorithm to sort an array of integers.

// Using Divide and Conquer (Merge Sort)
function mergeSort(arr) {
  if (arr.length <= 1) return arr;

  const middle = Math.floor(arr.length / 2);
  const left = arr.slice(0, middle);
  const right = arr.slice(middle);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  let result = [];
  let leftIndex = 0;
  let rightIndex = 0;

  while (leftIndex < left.length && rightIndex < right.length) {
    if (left[leftIndex] < right[rightIndex]) {
      result.push(left[leftIndex]);
      leftIndex++;
    } else {
      result.push(right[rightIndex]);
      rightIndex++;
    }
  }

  return result.concat(left.slice(leftIndex)).concat(right.slice(rightIndex));
}

const arr = [38, 27, 43, 3, 9, 82, 10];
console.log(mergeSort(arr)); // Output: [3, 9, 10, 27, 38, 43, 82]
In this example, we are using the divide and conquer strategy to implement the merge sort algorithm. The mergeSort function recursively divides the array into smaller subarrays, sorts them, and then merges them back together in a sorted manner.

These examples showcase practical applications of the mentioned optimization techniques:

Dynamic Programming (Longest Increasing Subsequence)
Hashing (Two Sum)
Divide and Conquer (Merge Sort)
These optimization techniques help improve the efficiency and performance of the algorithms, making them suitable for real-world scenarios and larger datasets. Remember that each technique addresses specific types of problems, and choosing the right approach depends on the nature of the problem you are trying to solve.    









7.Problem Task: 0/1 Knapsack
Given a list of items with their weights and values, and a maximum weight capacity, find the maximum total value that can be obtained by selecting items without exceeding the capacity.

// Using Dynamic Programming for 0/1 Knapsack
function knapsack(weights, values, capacity) {
  const n = weights.length;
  const dp = new Array(n + 1).fill(0).map(() => new Array(capacity + 1).fill(0));

  for (let i = 1; i <= n; i++) {
    for (let j = 0; j <= capacity; j++) {
      if (weights[i - 1] <= j) {
        dp[i][j] = Math.max(dp[i - 1][j], values[i - 1] + dp[i - 1][j - weights[i - 1]]);
      } else {
        dp[i][j] = dp[i - 1][j];
      }
    }
  }

  return dp[n][capacity];
}

const weights = [2, 3, 4, 5];
const values = [3, 4, 5, 6];
const capacity = 5;
console.log(knapsack(weights, values, capacity)); // Output: 7 (Select items 1 and 3 with total weight 5 and value 7)
In this example, we are using dynamic programming to solve the 0/1 knapsack problem. The dp array stores the maximum total value that can be obtained for each subproblem with different weights and capacities.




  
8.Problem Task: Longest Common Subsequence (LCS)
Given two strings, find the length of their longest common subsequence.

// Using Dynamic Programming for Longest Common Subsequence (LCS)
function longestCommonSubsequence(text1, text2) {
  const m = text1.length;
  const n = text2.length;
  const dp = new Array(m + 1).fill(0).map(() => new Array(n + 1).fill(0));

  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (text1[i - 1] === text2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
      } else {
        dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }

  return dp[m][n];
}

const text1 = "abcde";
const text2 = "ace";
console.log(longestCommonSubsequence(text1, text2)); // Output: 3 (LCS: "ace")
In this example, we are using dynamic programming to find the length of the longest common subsequence between two strings text1 and text2. The dp array stores the length of the longest common subsequence for different prefixes of the strings.





  
9.Problem Task: Dijkstras Algorithm
Find the shortest path from a given source vertex to all other vertices in a weighted graph.


// Using Greedy Algorithm (Dijkstras Algorithm)
function dijkstra(graph, source) {
  const distances = {};
  const visited = new Set();
  const vertices = Object.keys(graph);

  vertices.forEach((vertex) => (distances[vertex] = Infinity));
  distances[source] = 0;

  while (visited.size !== vertices.length) {
    let currentVertex = null;

    vertices.forEach((vertex) => {
      if (!visited.has(vertex) && (currentVertex === null || distances[vertex] < distances[currentVertex])) {
        currentVertex = vertex;
      }
    });

    visited.add(currentVertex);

    for (const neighbor in graph[currentVertex]) {
      const totalDistance = distances[currentVertex] + graph[currentVertex][neighbor];
      if (totalDistance < distances[neighbor]) {
        distances[neighbor] = totalDistance;
      }
    }
  }

  return distances;
}

const graph = {
  A: { B: 1, C: 4 },
  B: { A: 1, C: 2, D: 5 },
  C: { A: 4, B: 2, D: 1 },
  D: { B: 5, C: 1 },
};
const source = "A";
console.log(dijkstra(graph, source)); // Output: { A: 0, B: 1, C: 3, D: 4 }
In this example, we are using Dijkstras algorithm, which is a greedy algorithm, to find the shortest path from the source vertex to all other vertices in a weighted graph.

These examples demonstrate practical applications of the optimization techniques mentioned earlier:

Dynamic Programming (0/1 Knapsack, Longest Common Subsequence)
Greedy Algorithm (Dijkstras Algorithm)
By applying these techniques, you can significantly improve the efficiency and performance of algorithms in various problem-solving scenarios. Remember that the choice of optimization technique depends on the problems nature and the specific data constraints. Always analyze the problem requirements and constraints before deciding which approach to use.







10.Problem Task: Maximum Subarray Sum
Find the maximum sum of a contiguous subarray in a given array.

// Using Kadanes Algorithm for Maximum Subarray Sum
function maxSubarraySum(arr) {
  let maxSum = arr[0];
  let currentSum = arr[0];

  for (let i = 1; i < arr.length; i++) {
    currentSum = Math.max(arr[i], currentSum + arr[i]);
    maxSum = Math.max(maxSum, currentSum);
  }

  return maxSum;
}

const arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
console.log(maxSubarraySum(arr)); // Output: 6 (Subarray: [4, -1, 2, 1])
In this example, we are using Kadanes algorithm, which is a variation of the greedy algorithm, to find the maximum subarray sum. The algorithm keeps track of the current sum and the maximum sum while iterating through the array.





  
11.Problem Task: Coin Change
Given a set of coin denominations and a target amount, find the minimum number of coins needed to make up that amount.

// Using Dynamic Programming for Coin Change
function coinChange(coins, amount) {
  const dp = new Array(amount + 1).fill(Infinity);
  dp[0] = 0;

  for (const coin of coins) {
    for (let i = coin; i <= amount; i++) {
      dp[i] = Math.min(dp[i], dp[i - coin] + 1);
    }
  }

  return dp[amount] === Infinity ? -1 : dp[amount];
}

const coins = [1, 2, 5];
const amount = 11;
console.log(coinChange(coins, amount)); // Output: 3 (Coins: [5, 5, 1])
In this example, we are using dynamic programming to solve the coin change problem. The dp array stores the minimum number of coins needed to make up each amount from 0 to the target amount.



    
12.Problem Task: Topological Sort
Perform a topological sort on a directed acyclic graph (DAG).

javascript
Copy code
// Using Depth-First Search (DFS) for Topological Sort
function topologicalSort(graph) {
  const visited = new Set();
  const stack = [];

  function dfs(node) {
    visited.add(node);

    for (const neighbor of graph[node]) {
      if (!visited.has(neighbor)) {
        dfs(neighbor);
      }
    }

    stack.push(node);
  }

  for (const node in graph) {
    if (!visited.has(node)) {
      dfs(node);
    }
  }

  return stack.reverse();
}

const graph = {
  A: ["C"],
  B: ["A", "C"],
  C: ["D"],
  D: [],
};
console.log(topologicalSort(graph)); // Output: ["B", "A", "C", "D"]
In this example, we are using depth-first search (DFS) to perform a topological sort on a directed acyclic graph (DAG). The topological sort gives an ordering of the nodes such that for every directed edge (u, v), node u comes before node v in the ordering.

These examples demonstrate additional practical applications of the optimization techniques mentioned earlier:

Greedy Algorithm (Maximum Subarray Sum)
Dynamic Programming (Coin Change)
Depth-First Search (DFS) (Topological Sort)
By applying these techniques, you can efficiently solve a wide range of problems in different areas such as optimization, graph algorithms, and dynamic programming tasks. As always, understanding the problem requirements and constraints is crucial in choosing the right optimization technique to use.









 13.Problem Task: Longest Palindromic Subsequence (LPS)
Find the length of the longest palindromic subsequence in a given string.

// Using Dynamic Programming for Longest Palindromic Subsequence (LPS)
function longestPalindromicSubsequence(str) {
  const n = str.length;
  const dp = new Array(n).fill(0).map(() => new Array(n).fill(0));

  for (let i = 0; i < n; i++) {
    dp[i][i] = 1;
  }

  for (let len = 2; len <= n; len++) {
    for (let i = 0; i < n - len + 1; i++) {
      const j = i + len - 1;
      if (str[i] === str[j] && len === 2) {
        dp[i][j] = 2;
      } else if (str[i] === str[j]) {
        dp[i][j] = dp[i + 1][j - 1] + 2;
      } else {
        dp[i][j] = Math.max(dp[i][j - 1], dp[i + 1][j]);
      }
    }
  }

  return dp[0][n - 1];
}

const str = "bbbab";
console.log(longestPalindromicSubsequence(str)); // Output: 4 (LPS: "bbbb")
In this example, we are using dynamic programming to find the length of the longest palindromic subsequence in the string str. The dp array stores the length of the longest palindromic subsequence for different substrings of the input string.



  
14.Problem Task: N-Queens Problem
  
Place N queens on an N x N chessboard such that no two queens attack each other.

// Using Backtracking for N-Queens Problem
function solveNQueens(n) {
  const results = [];

  function backtrack(queens, row) {
    if (row === n) {
      results.push(queens.map((col) => ".".repeat(col) + "Q" + ".".repeat(n - col - 1)));
      return;
    }

    for (let col = 0; col < n; col++) {
      if (!queens.some((c, r) => c === col || c - col === r - row || c - col === row - r)) {
        queens.push(col);
        backtrack(queens, row + 1);
        queens.pop();
      }
    }
  }

  backtrack([], 0);
  return results;
}

console.log(solveNQueens(4));
// Output: [
//   [".Q..", "...Q", "Q...", "..Q."],
//   ["..Q.", "Q...", "...Q", ".Q.."]
// ]
In this example, we are using backtracking to solve the N-Queens problem. The backtrack function recursively places queens on the chessboard and ensures that no two queens attack each other.


      
15.Problem Task: Matrix Chain Multiplication
Given a sequence of matrices, find the most efficient way to multiply them.

// Using Dynamic Programming for Matrix Chain Multiplication
function matrixChainMultiplication(dimensions) {
  const n = dimensions.length - 1;
  const dp = new Array(n).fill(0).map(() => new Array(n).fill(0));

  for (let len = 2; len <= n; len++) {
    for (let i = 0; i < n - len + 1; i++) {
      const j = i + len - 1;
      dp[i][j] = Infinity;
      for (let k = i; k < j; k++) {
        const cost = dp[i][k] + dp[k + 1][j] + dimensions[i] * dimensions[k + 1] * dimensions[j + 1];
        dp[i][j] = Math.min(dp[i][j], cost);
      }
    }
  }

  return dp[0][n - 1];
}

const dimensions = [10, 30, 5, 60];
console.log(matrixChainMultiplication(dimensions)); // Output: 4500
In this example, we are using dynamic programming to find the minimum number of scalar multiplications required to multiply a sequence of matrices. The dp array stores the minimum cost of multiplication for different subsequences of the input matrix dimensions.

These examples demonstrate further practical applications of the optimization techniques mentioned earlier:

Dynamic Programming (Longest Palindromic Subsequence, Matrix Chain Multiplication)
Backtracking (N-Queens Problem)
By applying these techniques, you can efficiently solve a wide range of problems in different areas, such as string manipulation, graph theory, and optimization tasks. The optimization techniques discussed earlier play a crucial role in achieving efficient solutions to these problems. Always analyze the problem requirements and constraints before deciding which approach to use.






16.Problem Task: Longest Palindromic Subsequence (LPS)
Find the length of the longest palindromic subsequence in a given string.

// Using Dynamic Programming for Longest Palindromic Subsequence (LPS)
function longestPalindromicSubsequence(str) {
  const n = str.length;
  const dp = new Array(n).fill(0).map(() => new Array(n).fill(0));

  for (let i = 0; i < n; i++) {
    dp[i][i] = 1;
  }

  for (let len = 2; len <= n; len++) {
    for (let i = 0; i < n - len + 1; i++) {
      const j = i + len - 1;
      if (str[i] === str[j] && len === 2) {
        dp[i][j] = 2;
      } else if (str[i] === str[j]) {
        dp[i][j] = dp[i + 1][j - 1] + 2;
      } else {
        dp[i][j] = Math.max(dp[i][j - 1], dp[i + 1][j]);
      }
    }
  }

  return dp[0][n - 1];
}

const str = "bbbab";
console.log(longestPalindromicSubsequence(str)); // Output: 4 (LPS: "bbbb")
In this example, we are using dynamic programming to find the length of the longest palindromic subsequence in the string str. The dp array stores the length of the longest palindromic subsequence for different substrings of the input string.



  
17.Problem Task: N-Queens Problem
Place N queens on an N x N chessboard such that no two queens attack each other.

// Using Backtracking for N-Queens Problem
function solveNQueens(n) {
  const results = [];

  function backtrack(queens, row) {
    if (row === n) {
      results.push(queens.map((col) => ".".repeat(col) + "Q" + ".".repeat(n - col - 1)));
      return;
    }

    for (let col = 0; col < n; col++) {
      if (!queens.some((c, r) => c === col || c - col === r - row || c - col === row - r)) {
        queens.push(col);
        backtrack(queens, row + 1);
        queens.pop();
      }
    }
  }

  backtrack([], 0);
  return results;
}

console.log(solveNQueens(4));
// Output: [
//   [".Q..", "...Q", "Q...", "..Q."],
//   ["..Q.", "Q...", "...Q", ".Q.."]
// ]
In this example, we are using backtracking to solve the N-Queens problem. The backtrack function recursively places queens on the chessboard and ensures that no two queens attack each other.



      
18.Problem Task: Matrix Chain Multiplication
Given a sequence of matrices, find the most efficient way to multiply them.

// Using Dynamic Programming for Matrix Chain Multiplication
function matrixChainMultiplication(dimensions) {
  const n = dimensions.length - 1;
  const dp = new Array(n).fill(0).map(() => new Array(n).fill(0));

  for (let len = 2; len <= n; len++) {
    for (let i = 0; i < n - len + 1; i++) {
      const j = i + len - 1;
      dp[i][j] = Infinity;
      for (let k = i; k < j; k++) {
        const cost = dp[i][k] + dp[k + 1][j] + dimensions[i] * dimensions[k + 1] * dimensions[j + 1];
        dp[i][j] = Math.min(dp[i][j], cost);
      }
    }
  }

  return dp[0][n - 1];
}

const dimensions = [10, 30, 5, 60];
console.log(matrixChainMultiplication(dimensions)); // Output: 4500
In this example, we are using dynamic programming to find the minimum number of scalar multiplications required to multiply a sequence of matrices. The dp array stores the minimum cost of multiplication for different subsequences of the input matrix dimensions.

These examples demonstrate further practical applications of the optimization techniques mentioned earlier:

Dynamic Programming (Longest Palindromic Subsequence, Matrix Chain Multiplication)
Backtracking (N-Queens Problem)
By applying these techniques, you can efficiently solve a wide range of problems in different areas, such as string manipulation, graph theory, and optimization tasks. The optimization techniques discussed earlier play a crucial role in achieving efficient solutions to these problems. Always analyze the problem requirements and constraints before deciding which approach to use.







19.Problem Task: Edit Distance (Levenshtein Distance)
Given two strings, find the minimum number of operations (insert, delete, or replace) required to convert one string into the other.

// Using Dynamic Programming for Edit Distance (Levenshtein Distance)
function minDistance(word1, word2) {
  const m = word1.length;
  const n = word2.length;
  const dp = new Array(m + 1).fill(0).map(() => new Array(n + 1).fill(0));

  for (let i = 0; i <= m; i++) {
    dp[i][0] = i;
  }

  for (let j = 0; j <= n; j++) {
    dp[0][j] = j;
  }

  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (word1[i - 1] === word2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        dp[i][j] = 1 + Math.min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]);
      }
    }
  }

  return dp[m][n];
}

const word1 = "horse";
const word2 = "ros";
console.log(minDistance(word1, word2)); // Output: 3
In this example, we are using dynamic programming to find the minimum number of operations required to convert one string into another. The dp array stores the minimum number of operations for different prefixes of the input strings.



  
20.Problem Task: Longest Increasing Subarray
Given an array of integers, find the length of the longest increasing subarray.

javascript
Copy code
// Using Sliding Window Technique for Longest Increasing Subarray
function longestIncreasingSubarray(nums) {
  let maxLength = 1;
  let start = 0;

  for (let end = 1; end < nums.length; end++) {
    if (nums[end] > nums[end - 1]) {
      const currentLength = end - start + 1;
      maxLength = Math.max(maxLength, currentLength);
    } else {
      start = end;
    }
  }

  return maxLength;
}

const nums = [1, 3, 5, 4, 7];
console.log(longestIncreasingSubarray(nums)); // Output: 3 (Subarray: [3, 5, 4])
In this example, we are using the sliding window technique to find the length of the longest increasing subarray in the array nums. The approach involves maintaining a window of increasing elements and updating the maximum length when a non-increasing element is encountered.



    
21.Problem Task: Travelling Salesman Problem (TSP)
Find the shortest possible route that visits all cities and returns to the starting city, visiting each city exactly once.

// Using Dynamic Programming for Travelling Salesman Problem (TSP)
function tsp(graph, start) {
  const n = graph.length;
  const allVisited = (1 << n) - 1;
  const memo = {};

  function dfs(city, visited) {
    if (visited === allVisited) {
      return graph[city][start];
    }

    const key = `${city}-${visited}`;
    if (memo[key] !== undefined) {
      return memo[key];
    }

    let minDistance = Infinity;
    for (let nextCity = 0; nextCity < n; nextCity++) {
      if (nextCity !== city && (visited & (1 << nextCity)) === 0) {
        const newVisited = visited | (1 << nextCity);
        const distance = graph[city][nextCity] + dfs(nextCity, newVisited);
        minDistance = Math.min(minDistance, distance);
      }
    }

    memo[key] = minDistance;
    return minDistance;
  }

  return dfs(start, 1 << start);
}

const graph = [
  [0, 10, 15, 20],
  [10, 0, 35, 25],
  [15, 35, 0, 30],
  [20, 25, 30, 0],
];
const start = 0;
console.log(tsp(graph, start)); // Output: 80 (Shortest route: 0 -> 1 -> 3 -> 2 -> 0)
In this example, we are using dynamic programming with bit masking to solve the Travelling Salesman Problem (TSP). The dfs function explores all possible paths to find the shortest route that visits all cities and returns to the starting city, visiting each city exactly once.

These examples demonstrate additional practical applications of the optimization techniques mentioned earlier:

Dynamic Programming (Edit Distance, TSP)
Sliding Window Technique (Longest Increasing Subarray)
By applying these techniques, you can efficiently solve various problems in different areas, such as string processing, optimization, and combinatorial problems. As always, analyzing the problem requirements and constraints is essential in choosing the right optimization technique to use.






22.Problem Task: Longest Common Substring
Given two strings, find the length of the longest common substring (continuous sequence of characters) between them.

// Using Dynamic Programming for Longest Common Substring
function longestCommonSubstring(str1, str2) {
  const m = str1.length;
  const n = str2.length;
  const dp = new Array(m + 1).fill(0).map(() => new Array(n + 1).fill(0));
  let maxLength = 0;

  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (str1[i - 1] === str2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
        maxLength = Math.max(maxLength, dp[i][j]);
      } else {
        dp[i][j] = 0;
      }
    }
  }

  return maxLength;
}

const str1 = "ABABC";
const str2 = "BABCBA";
console.log(longestCommonSubstring(str1, str2)); // Output: 4 (Longest Common Substring: "BABC")
In this example, we are using dynamic programming to find the length of the longest common substring between two strings str1 and str2. The dp array stores the length of the longest common substring for different prefixes of the input strings.



  
23.Problem Task: Longest Palindromic Substring
Given a string, find the longest palindromic substring (continuous sequence of characters that reads the same backward as forward).

// Using Expand Around Center Technique for Longest Palindromic Substring
function longestPalindrome(s) {
  let start = 0;
  let maxLength = 1;

  function expandAroundCenter(left, right) {
    while (left >= 0 && right < s.length && s[left] === s[right]) {
      if (right - left + 1 > maxLength) {
        start = left;
        maxLength = right - left + 1;
      }
      left--;
      right++;
    }
  }

  for (let i = 0; i < s.length; i++) {
    expandAroundCenter(i, i); // For odd-length palindromes (centered at i)
    expandAroundCenter(i, i + 1); // For even-length palindromes (centered between i and i+1)
  }

  return s.slice(start, start + maxLength);
}

const s = "babad";
console.log(longestPalindrome(s)); // Output: "bab" or "aba" (Both are valid answers)
In this example, we are using the Expand Around Center technique to find the longest palindromic substring in the string s. The expandAroundCenter function expands around the center of a potential palindrome and updates the start and maxLength variables accordingly.



      
24.Problem Task: Subarray Sum Equals K
Given an array of integers and a target sum k, find the total number of continuous subarrays whose sum equals k.

// Using Hashing for Subarray Sum Equals K
function subarraySum(nums, k) {
  let count = 0;
  let sum = 0;
  const sumMap = new Map();
  sumMap.set(0, 1); // Initialize the map with a sum of 0 occurring once

  for (const num of nums) {
    sum += num;
    if (sumMap.has(sum - k)) {
      count += sumMap.get(sum - k);
    }
    sumMap.set(sum, (sumMap.get(sum) || 0) + 1);
  }

  return count;
}

const nums = [1, 1, 1];
const k = 2;
console.log(subarraySum(nums, k)); // Output: 2 (Subarrays: [1, 1], [1, 1])
In this example, we are using hashing (a JavaScript Map) to find the total number of continuous subarrays whose sum equals the target sum k. The approach involves keeping track of the cumulative sum at each index and the number of occurrences of each sum in a map.

These examples demonstrate further practical applications of the optimization techniques mentioned earlier:

Dynamic Programming (Longest Common Substring)
Expand Around Center Technique (Longest Palindromic Substring)
Hashing (Subarray Sum Equals K)
By applying these techniques, you can efficiently solve a variety of problems in different areas, such as string manipulation, array manipulation, and optimization tasks. As always, understanding the problem requirements and constraints is crucial in choosing the right optimization technique to use.










  

