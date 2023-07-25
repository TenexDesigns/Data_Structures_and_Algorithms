


finding gcd using euclidian algorithm, finding permutaions and combinations of a list of numbers, finding the longest common substring of a given string, knapsack problem, Help me underatnd the follwing wich code samples in javascript
***********************************************************************************************************************************************







Sure, lets understand each of these problems with code samples in JavaScript:



Finding GCD using Euclidean Algorithm:
The Euclidean Algorithm is an efficient method for finding the Greatest Common Divisor (GCD) of two numbers. It repeatedly applies the property that the GCD of two numbers is the same as the GCD of the smaller number and the remainder of the division of the larger number by the smaller number.

function gcd(a, b) {
  while (b !== 0) {
    let temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

const num1 = 48;
const num2 = 18;
console.log(gcd(num1, num2)); // Output: 6





  
Finding Permutations and Combinations of a List of Numbers:
To find permutations and combinations of a list of numbers, you can use recursion to generate all possible arrangements. Permutations refer to the arrangement of elements in a specific order, while combinations refer to selecting elements without considering the order.

function permutations(nums) {
  if (nums.length === 0) return [[]];

  const result = [];
  for (let i = 0; i < nums.length; i++) {
    const current = nums[i];
    const remaining = nums.slice(0, i).concat(nums.slice(i + 1));
    const perms = permutations(remaining);
    for (let perm of perms) {
      result.push([current, ...perm]);
    }
  }
  return result;
}

function combinations(nums, k) {
  const result = [];
  backtrack([], 0);
  return result;

  function backtrack(curr, start) {
    if (curr.length === k) {
      result.push(curr.slice());
      return;
    }

    for (let i = start; i < nums.length; i++) {
      curr.push(nums[i]);
      backtrack(curr, i + 1);
      curr.pop();
    }
  }
}

const nums = [1, 2, 3];
console.log(permutations(nums));
/* Output:
[
  [ 1, 2, 3 ],
  [ 1, 3, 2 ],
  [ 2, 1, 3 ],
  [ 2, 3, 1 ],
  [ 3, 1, 2 ],
  [ 3, 2, 1 ]
]
*/

console.log(combinations(nums, 2));
/* Output:
[
  [ 1, 2 ],
  [ 1, 3 ],
  [ 2, 3 ]
]
*/





    
Finding the Longest Common Substring of a Given String:
The Longest Common Substring is the longest sequence of characters that appears in two or more strings.

function longestCommonSubstring(str1, str2) {
  const m = str1.length;
  const n = str2.length;
  let maxLength = 0;
  let endIndex = 0;

  const dp = Array.from({ length: m + 1 }, () => Array(n + 1).fill(0));

  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (str1[i - 1] === str2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
        if (dp[i][j] > maxLength) {
          maxLength = dp[i][j];
          endIndex = i;
        }
      }
    }
  }

  return str1.substring(endIndex - maxLength, endIndex);
}

const str1 = 'ABABC';
const str2 = 'BABCA';
console.log(longestCommonSubstring(str1, str2)); // Output: 'BABC'



      
Knapsack Problem:
The Knapsack Problem is a classic optimization problem that aims to maximize the total value of items that can be included in a knapsack (with a limited weight capacity).

function knapsack(items, capacity) {
  const n = items.length;
  const dp = Array.from({ length: n + 1 }, () => Array(capacity + 1).fill(0));

  for (let i = 1; i <= n; i++) {
    for (let w = 1; w <= capacity; w++) {
      if (items[i - 1].weight <= w) {
        dp[i][w] = Math.max(
          dp[i - 1][w],
          dp[i - 1][w - items[i - 1].weight] + items[i - 1].value
        );
      } else {
        dp[i][w] = dp[i - 1][w];
      }
    }
  }

  return dp[n][capacity];
}

const items = [
  { weight: 2, value: 10 },
  { weight: 3, value: 15 },
  { weight: 5, value: 20 },
  { weight: 7, value: 25 },
];
const capacity = 10;
console.log(knapsack(items, capacity)); // Output: 45
These are examples of algorithms made using the mentioned techniques. Each algorithm addresses a specific problem and follows the corresponding design approach to achieve an efficient and effective solution.




