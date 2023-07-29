Here are additional practical examples where hash tables can be used in JavaScript:

Removing duplicates from an array: Hash tables can be used to remove duplicates from an array. This can be done by storing each element of the array in the hash table. If the element is already in the hash table, its a duplicate and is not added to the result array. This solution has a time complexity of O(n) educative.io.
function removeDuplicates(arr) {
    let hash = {};
    let result = [];
    
    for (let i = 0; i < arr.length; i++) {
        if (!hash[arr[i]]) {
            hash[arr[i]] = true;
            result.push(arr[i]);
        }
    }
    
    return result;
}

      
Two Sum Problem: Given an array of integers and a target sum, find two numbers in the array that add up to the target sum. This can be solved using a hash table by storing each number in the hash table and checking if the difference between the target sum and the current number exists in the hash table scraggo.com.
function twoSum(nums, target) {
    let hash = {};
    
    for (let i = 0; i < nums.length; i++) {
        let complement = target - nums[i];
        
        if (hash[complement] !== undefined) {
            return [hash[complement], i];
        }
        
        hash[nums[i]] = i;
    }
    
    return [];
}


      
Counting the frequency of words in a text: Hash tables can be used to count the frequency of words in a text. This can be done by splitting the text into words, then storing each word in the hash table and incrementing its count each time it appears.
function wordCount(text) {
    let words = text.split(' ');
    let hash = {};
    
    for (let i = 0; i < words.length; i++) {
        let word = words[i];
        
        if (hash[word]) {
            hash[word]++;
        } else {
            hash[word] = 1;
        }
    }
    
    return hash;
}
Optimization of hash tables in JavaScript can be achieved through:

Choosing a good hashing function: A good hashing function should produce a unique hash code for each key to minimize collisions iq.opengenus.org.
Resolving collisions efficiently: Collisions can occur when two different keys produce the same hash code. When a collision occurs, the hash table needs to resolve the collision to store both values correctly. One common way to resolve collisions is to use separate chaining, where each table index contains a linked list of values iq.opengenus.org.
Using the built-in JavaScript Map object for more functionality: If you need more functionality than an object provides, such as the ability to store any data type as a key, use a Map instead iq.opengenus.org.
