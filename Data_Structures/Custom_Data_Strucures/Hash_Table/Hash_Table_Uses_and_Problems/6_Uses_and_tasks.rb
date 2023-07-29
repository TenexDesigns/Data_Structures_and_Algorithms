Hash tables are a data structure that allows you to create a list of paired values (key-value pairs). They are commonly used because of their fast search, insertion, and delete operations freecodecamp.org.

One of the most common uses of hash tables is to manage and optimize code, as they allow for efficient storage and retrieval of data linkedin.com.

Here are some practical examples where hash tables can be used:


  
Finding Majority Element: The majority element in an array is the element that appears more than n/2 times where n is the size of the array. In JavaScript, you can use a hash table to count the frequency of all array elements, then iterate over the hash table to find the majority element techiedelight.com.
function findMajority(arr) {
    let hash = {};
    let n = arr.length;
    
    for (let i = 0; i < n; i++) {
        if (hash[arr[i]]) {
            hash[arr[i]]++;
        } else {
            hash[arr[i]] = 1;
        }
    }
    
    for (let key in hash) {
        if (hash[key] > Math.floor(n/2)) {
            return key;
        }
    }
    
    return "No Majority Element";
}


      
Grouping Elements Based on Their First Occurrence: You can use a hash table to track the first occurrence of each element in an array. If the element is not in the hash table, add it. If it is already in the hash table, ignore it. This will give you an array of elements grouped by their first occurrence techiedelight.com.
function groupElements(arr) {
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


      
Dynamic resizing: As the number of elements in the hash table changes, it can dynamically expand or contract, maintaining an optimal load factor and fast lookup times geeksforgeeks.org.
Remember that JavaScript provides inbuilt objects and Map data structure which is an implementation of hash tables. However, if you want to implement your own hash table, you can do so as demonstrated in section.io. This includes methods for hashing keys, setting items in the hash table, and retrieving items from the hash table.

Optimization of hash tables can be achieved by handling collisions effectively, maintaining a good load factor, and resizing the hash table when necessary.

