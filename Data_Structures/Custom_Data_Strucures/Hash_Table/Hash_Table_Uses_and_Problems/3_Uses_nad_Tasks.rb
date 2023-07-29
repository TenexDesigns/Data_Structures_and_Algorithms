Sure, here are some more problems/tasks along with their solutions using the hash table implementation in JavaScript:

Task: Check Permutation
Problem: Given two strings, check if one is a permutation of the other.
Solution using Hash Table:

javascript
Copy code
function checkPermutation(str1, str2) {
  if (str1.length !== str2.length) {
    return false;
  }

  const charFrequency = new HashTable();
  for (const char of str1) {
    charFrequency.set(char, (charFrequency.get(char) || 0) + 1);
  }

  for (const char of str2) {
    if (!charFrequency.has(char)) {
      return false;
    }
    charFrequency.set(char, charFrequency.get(char) - 1);
    if (charFrequency.get(char) < 0) {
      return false;
    }
  }

  return true;
}

console.log(checkPermutation('abc', 'cab')); // Output: true



    
Task: Find the Longest Subarray with Equal Number of 0s and 1s
Problem: Given an array of 0s and 1s, find the longest subarray with an equal number of 0s and 1s.
Solution using Hash Table:

javascript
Copy code
function findLongestSubarrayWithEqualZerosAndOnes(nums) {
  const sumHashTable = new HashTable();
  let maxLength = 0;
  let sum = 0;

  for (let i = 0; i < nums.length; i++) {
    sum += nums[i] === 0 ? -1 : 1;

    if (sum === 0) {
      maxLength = i + 1;
    } else if (sumHashTable.has(sum)) {
      maxLength = Math.max(maxLength, i - sumHashTable.get(sum));
    } else {
      sumHashTable.set(sum, i);
    }
  }

  return maxLength;
}

const nums = [0, 1, 0, 1, 1, 0, 1, 0, 1, 0];
console.log(findLongestSubarrayWithEqualZerosAndOnes(nums)); // Output: 10




    
Task: Group Anagrams
Problem: Given an array of strings, group the anagrams together.
Solution using Hash Table:

javascript
Copy code
function groupAnagrams(strs) {
  const anagramHashTable = new HashTable();
  for (const str of strs) {
    const sortedStr = str.split('').sort().join('');
    if (!anagramHashTable.has(sortedStr)) {
      anagramHashTable.set(sortedStr, []);
    }
    anagramHashTable.get(sortedStr).push(str);
  }

  const result = [];
  for (const key in anagramHashTable.table) {
    if (Object.prototype.hasOwnProperty.call(anagramHashTable.table, key)) {
      result.push(anagramHashTable.get(key));
    }
  }

  return result;
}

const strs = ['eat', 'tea', 'tan', 'ate', 'nat', 'bat'];
console.log(groupAnagrams(strs));
/* Output: [
  ['eat', 'tea', 'ate'],
  ['tan', 'nat'],
  ['bat']
] */




    
Task: Implementing a Frequency Counter
Problem: Given an array of elements, count the frequency of each element.
Solution using Hash Table:

javascript
Copy code
function getFrequencyCounter(arr) {
  const frequencyCounter = new HashTable();
  arr.forEach((element) => {
    const count = frequencyCounter.get(element) || 0;
    frequencyCounter.set(element, count + 1);
  });
  return frequencyCounter;
}

const array = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
const frequencyCounter = getFrequencyCounter(array);
console.log(frequencyCounter.get(3)); // Output: 3 (frequency of 3)
These examples demonstrate how hash tables can be effectively used to solve various problems and tasks efficiently. The hash table is a versatile data structure that finds applications in areas like frequency counting, string manipulation, anagram grouping, and more. It allows for fast data retrieval, insertion, and lookup, making it a powerful tool for solving diverse problems.




