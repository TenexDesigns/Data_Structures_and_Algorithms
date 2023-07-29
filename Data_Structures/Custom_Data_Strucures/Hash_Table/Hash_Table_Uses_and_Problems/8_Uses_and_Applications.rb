Hash tables are a widely used data structure that allow us to store key-value pairs. They are used in a variety of applications, such as database indexing, caching, and implementing associative arrays or dictionaries.

The following are some practical use cases for hash tables and ways to optimize them:

Caching: Hash tables can be used to implement caches. When a result of a computation is obtained, it can be stored in a hash table. If the same computation needs to be done again, you can check if the result is already in the hash table. If it is, you can simply return the cached result. This can significantly speed up your program if the same computations are done frequently.
Here is a simple caching function implemented with a JavaScript object acting as a hash table:

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

console.log(memoizedAddTo80(5));  // long time
console.log(memoizedAddTo80(5));  // returns from cache
In this example, the first time memoizedAddTo80(5) is called, the function takes a long time to compute and the result is stored in the cache. The second time the function is called with the same argument, the result is returned from the cache instantly educative.io.

Database indexing: Hash tables can be used to implement database indexes. This can significantly speed up data retrieval operations because it allows us to look up records in constant time.
Counting unique elements: If you need to count unique elements in a collection, you can use a hash table. You can iterate through the collection and for each item, add it as a key to the hash table with the value being the count. This can be done in O(n) time, which is more efficient than other methods that may require sorting or nested loops.
Here is an example:

function countUniqueValues(arr) {
  let count = {};

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] in count) {
      count[arr[i]] += 1;
    } else {
      count[arr[i]] = 1;
    }
  }

  return count;
}

console.log(countUniqueValues([1, 1, 2, 2, 3, 4, 4, 4]));  // { '1': 2, '2': 2, '3': 1, '4': 3 }
In this example, the function countUniqueValues counts the occurrence of each unique value in the input array and stores the count in a hash table. The function then returns the hash table codecademy.com.

