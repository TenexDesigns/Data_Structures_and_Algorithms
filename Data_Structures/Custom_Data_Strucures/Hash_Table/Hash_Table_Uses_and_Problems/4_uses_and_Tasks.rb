Certainly! Here are some more problems/tasks along with their solutions using the hash table implementation in JavaScript:

Task: Find the First Non-Repeating Character in a String
Problem: Given a string, find the first non-repeating character in it and return its index. If it doesnt exist, return -1.
Solution using Hash Table:

javascript
Copy code
function firstNonRepeatingChar(str) {
  const charFrequency = new HashTable();
  for (const char of str) {
    charFrequency.set(char, (charFrequency.get(char) || 0) + 1);
  }

  for (let i = 0; i < str.length; i++) {
    if (charFrequency.get(str[i]) === 1) {
      return i;
    }
  }

  return -1;
}

const inputStr = 'leetcode';
console.log(firstNonRepeatingChar(inputStr)); // Output: 0 (index of 'l')



    
Task: Find Two Numbers That Add Up to a Target Sum
Problem: Given an array of integers and a target sum, find two numbers that add up to the target and return their indices.
Solution using Hash Table:

javascript
Copy code
function twoSum(nums, target) {
  const numHashTable = new HashTable();
  for (let i = 0; i < nums.length; i++) {
    const complement = target - nums[i];
    if (numHashTable.has(complement)) {
      return [numHashTable.get(complement), i];
    }
    numHashTable.set(nums[i], i);
  }
  return null;
}

const numbers = [2, 7, 11, 15];
const targetSum = 9;
console.log(twoSum(numbers, targetSum)); // Output: [0, 1] (indices of 2 and 7)



    
Task: Group People by Age
Problem: Given an array of people with their ages, group them by age and return a list of groups.
Solution using Hash Table:

javascript
Copy code
function groupPeopleByAge(people) {
  const ageGroups = new HashTable();
  for (const person of people) {
    if (!ageGroups.has(person.age)) {
      ageGroups.set(person.age, []);
    }
    ageGroups.get(person.age).push(person);
  }

  const result = [];
  for (const key in ageGroups.table) {
    if (Object.prototype.hasOwnProperty.call(ageGroups.table, key)) {
      result.push(ageGroups.get(key));
    }
  }

  return result;
}

const people = [
  { name: 'Alice', age: 25 },
  { name: 'Bob', age: 30 },
  { name: 'Cathy', age: 25 },
  { name: 'David', age: 30 },
  { name: 'Eva', age: 25 },
];
console.log(groupPeopleByAge(people));
/* Output: [
  [{ name: 'Alice', age: 25 }, { name: 'Cathy', age: 25 }, { name: 'Eva', age: 25 }],
  [{ name: 'Bob', age: 30 }, { name: 'David', age: 30 }]
] */




    
Task: Longest Substring Without Repeating Characters
Problem: Given a string, find the length of the longest substring without repeating characters.
Solution using Hash Table:

javascript
Copy code
function longestSubstringWithoutRepeatingChars(str) {
  const charIndex = new HashTable();
  let maxLength = 0;
  let left = 0;

  for (let right = 0; right < str.length; right++) {
    const char = str[right];
    if (charIndex.has(char) && charIndex.get(char) >= left) {
      left = charIndex.get(char) + 1;
    }
    charIndex.set(char, right);
    maxLength = Math.max(maxLength, right - left + 1);
  }

  return maxLength;
}

const inputString = 'abcabcbb';
console.log(longestSubstringWithoutRepeatingChars(inputString)); // Output: 3 (length of 'abc' or 'bca' or 'cab')
These examples demonstrate the versatility of the hash table in solving a wide range of problems efficiently. The hash table allows for constant-time lookups, insertions, and deletions, making it an excellent choice for scenarios that require quick data retrieval and processing. It can be applied in various use cases, such as frequency counting, pattern matching, data grouping, and more.




