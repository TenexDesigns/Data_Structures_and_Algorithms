Sure, lets go through each of these techniques with some code examples and problem tasks:

1.Memoization: 
This technique is useful when you have recursive functions that repeat calculations. For example, in a recursive Fibonacci sequence function, without memoization, you would end up calculating the same Fibonacci numbers multiple times. With memoization, you can store the results of each calculation in a cache and reuse them when needed, reducing the time complexity from exponential to linear.

  let cache = {};
function fib(n) {
  if (n <= 1) return n;
  if (cache[n]) return cache[n];
  cache[n] = fib(n - 1) + fib(n - 2);
  return cache[n];
}
console.log(fib(10)); // Output: 55


    
2.Dynamic Programming: 
    This technique is similar to memoization but is typically used to solve optimization problems by breaking them down into simpler subproblems. For example, the problem of finding the shortest path in a graph can be solved using dynamic programming.

      function shortestPath(graph, start, end) {
  let distances = {};
  distances[end] = Infinity;
  distances = Object.assign(distances, graph[start]);

  let parents = { end: null };
  for (let child in graph[start]) {
    parents[child] = start;
  }

  let node = shortestNode(distances, end);

  while (node) {
    let distance = distances[node];
    let children = graph[node];
    for (let child in children) {
      let newDistance = distance + children[child];
      if (!distances[child] || distances[child] > newDistance) {
        distances[child] = newDistance;
        parents[child] = node;
      }
    }
    node = shortestNode(distances, end);
  }

  let shortestPath = [end];
  let parent = parents[end];
  while (parent) {
    shortestPath.push(parent);
    parent = parents[parent];
  }
  shortestPath.reverse();

  let results = {
    distance: distances[end],
    path: shortestPath,
  };

  return results;
};



3.Sliding Window Technique:
This technique is useful for problems that involve arrays or strings and require you to find or calculate something among all contiguous subarrays or substrings of a certain size. For example, finding the maximum sum of any contiguous subarray of size k.

    function maxSum(arr, k) {
  let maxSum = 0;
  let windowSum = 0;

  for (let i = 0; i < k; i++) {
    windowSum += arr[i];
  }

  for (let i = k; i < arr.length; i++) {
    windowSum += arr[i] - arr[i - k];
    maxSum = Math.max(maxSum, windowSum);
  }

  return maxSum;
}
console.log(maxSum([2, 3, 4, 1, 5], 3)); // Output: 10



    
4.Binary Search:
    This technique is used for searching in a sorted array. It repeatedly divides the search space in half until the target element is found or the search space is empty.

        
        function binarySearch(arr, target) {
  let left = 0;
  let right = arr.length - 1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);

    if (arr[mid] === target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1;
}
console.log(binarySearch([1, 2, 3, 4, 5], 3)); // Output: 2




    
5.Greedy Algorithms:
    These algorithms make the locally optimal choice at each step in the hope of finding a global optimum. They are often used for problems like finding the minimum number of coins needed to make change.

        
        function makeChange(coins, amount) {
  coins.sort((a, b) => b - a);
  let totalCoins = 0;
  let i = 0;

  while (amount > 0) {
    if (coins[i] <= amount) {
      amount -= coins[i];
      totalCoins++;
    } else {
      i++;
    }
  }

  return totalCoins;
}
console.log(makeChange([1, 2, 5], 11)); // Output: 3


    
6.Divide and Conquer:
    This strategy involves dividing a problem into smaller subproblems, solving each one independently, and then combining their solutions to solve the original problem. Its used in various algorithms, like merge sort.

      function mergeSort(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  let result = [];
  let indexLeft = 0;
  let indexRight = 0;

  while (indexLeft < left.length && indexRight < right.length) {
    if (left[indexLeft] < right[indexRight]) {
      result.push(left[indexLeft]);
      indexLeft++;
    } else {
      result.push(right[indexRight]);
      indexRight++;
    }
  }

  return result.concat(left.slice(indexLeft)).concat(right.slice(indexRight));
}
console.log(mergeSort([4, 2, 5, 1, 6, 3])); // Output: [1, 2, 3, 4, 5, 6]



    
7.Hashing and Hash Tables:
    Hashing is a technique to map data to a fixed-size array, known as a hash table, based on a hashing function. It provides fast access and retrieval of data, making it useful for various searching and indexing algorithms.

        let hashTable = {};

function addToHashTable(key, value) {
  hashTable[key] = value;
}

function getFromHashTable(key) {
  return hashTable[key];
}

addToHashTable('name', 'John Doe');
console.log(getFromHashTable('name')); // Output: 'John Doe'

      
8.Parallelism: 
      In some cases, you can improve efficiency by parallelizing computations, especially for algorithms that involve intensive processing on large datasets. Parallel programming can be achieved using multi-threading or distributed computing. However, JavaScript is single-threaded, so it doesnt support parallelism in the traditional sense. But you can achieve something similar with asynchronous programming and promises.

          
          let promise1 = new Promise((resolve, reject) => {
  setTimeout(resolve, 500, 'one');
});

let promise2 = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, 'two');
});

Promise.all([promise1, promise2]).then((values) => {
  console.log(values); // ['one', 'two']
});



        
9.Space-Time Tradeoff:
        Sometimes, you can achieve efficiency by trading off memory usage for faster execution time or vice versa. For example, caching results may consume more memory but lead to faster computation.

            let cache = {};

function memoizedAddTo80(n) {
  if (n in cache) {
    return cache[n];
  } else {
    console.log('long time');
    cache[n] = n + 80;
    return cache[n];
  }
}

console.log(memoizedAddTo80(5)); // Output: 85
console.log(memoizedAddTo80(5)); // Output: 85




  
10.Preprocessing:
  If youre working with static data, you can preprocess it to make the algorithm more efficient. For example, if youre searching for items in a list, sorting the list first can make the search faster.

      let arr = [5, 2, 8, 9, 1];
arr.sort((a, b) => a - b);
console.log(binarySearch(arr, 8)); // Output: 3
I hope these examples help you understand these optimization techniques better!










    
