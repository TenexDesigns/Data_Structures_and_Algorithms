Sure, here are a few more problem tasks and their solutions using the hash table implementation in JavaScript:

Task: Find the Most Frequent Element in an Array
Problem: Given an array of integers, find the most frequent element and its frequency.
Solution using Hash Table:
javascript
Copy code
function mostFrequentElement(arr) {
  const numFrequency = new HashTable();
  let maxFrequency = 0;
  let mostFrequentNum = null;

  for (const num of arr) {
    numFrequency.set(num, (numFrequency.get(num) || 0) + 1);
    if (numFrequency.get(num) > maxFrequency) {
      maxFrequency = numFrequency.get(num);
      mostFrequentNum = num;
    }
  }

  return { number: mostFrequentNum, frequency: maxFrequency };
}

const numbers = [3, 1, 5, 2, 2, 1, 2, 3, 2];
console.log(mostFrequentElement(numbers)); // Output: { number: 2, frequency: 4 }




    
Task: Check if Two Strings are Anagrams
Problem: Given two strings, check if they are anagrams (contain the same characters in any order).
Solution using Hash Table:
javascript
Copy code
function areAnagrams(str1, str2) {
  if (str1.length !== str2.length) {
    return false;
  }

  const charFrequency1 = new HashTable();
  const charFrequency2 = new HashTable();

  for (const char of str1) {
    charFrequency1.set(char, (charFrequency1.get(char) || 0) + 1);
  }

  for (const char of str2) {
    charFrequency2.set(char, (charFrequency2.get(char) || 0) + 1);
  }

  for (const [char, count] of charFrequency1) {
    if (charFrequency2.get(char) !== count) {
      return false;
    }
  }

  return true;
}

const string1 = 'listen';
const string2 = 'silent';
console.log(areAnagrams(string1, string2)); // Output: true



    
Task: Find the Intersection of Two Arrays
Problem: Given two arrays, find their intersection (common elements).
Solution using Hash Table:
javascript
Copy code
function arrayIntersection(arr1, arr2) {
  const intersectionSet = new Set();
  const numFrequency = new HashTable();

  for (const num of arr1) {
    numFrequency.set(num, true);
  }

  for (const num of arr2) {
    if (numFrequency.get(num)) {
      intersectionSet.add(num);
    }
  }

  return Array.from(intersectionSet);
}

const array1 = [1, 2, 3, 4, 5];
const array2 = [3, 4, 5, 6, 7];
console.log(arrayIntersection(array1, array2)); // Output: [3, 4, 5]



    
Task: Find the Longest Consecutive Sequence in an Array
Problem: Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
Solution using Hash Table:
javascript
Copy code
function longestConsecutiveSequence(arr) {
  const numSet = new Set(arr);
  let longestSequence = 0;

  for (const num of arr) {
    if (!numSet.has(num - 1)) {
      let currentNum = num;
      let currentSequence = 1;

      while (numSet.has(currentNum + 1)) {
        currentNum++;
        currentSequence++;
      }

      longestSequence = Math.max(longestSequence, currentSequence);
    }
  }

  return longestSequence;
}

const numbers = [100, 4, 200, 1, 3, 2];
console.log(longestConsecutiveSequence(numbers)); // Output: 4 (longest sequence is [1, 2, 3, 4])
These examples illustrate the diverse range of problems that can be efficiently solved using the hash table. Hash tables provide a fast way to manage and process data, making them practical for various use cases such as finding duplicates, analyzing frequencies, checking anagrams, and more. By optimizing the hash table implementation and carefully selecting the hash function, you can further improve the performance of these solutions.




