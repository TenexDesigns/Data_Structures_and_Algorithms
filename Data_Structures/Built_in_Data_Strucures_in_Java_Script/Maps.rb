Map

A map is an unordered collection of key-value pairs.
  Both keys and vlaues can be of any data type.

To retrieve a value, you can use the corresponding key.
  Maps are iterables. They can be used with a for of loop.



OBJECTS VS MAPS

    Onjectsa are unordered where as maps are Orderred

    Keys in objects can  only be strings or symbol types, where as in maps they can be of any type
    An object has a prototype ans may contain a few  defaul keys which may collide with 


In JavaScript, a Map is a data structure that allows you to store key-value pairs, where both the keys and values can be of any data type.
    Unlike objects, Maps maintain the insertion order of elements, making them suitable for scenarios where order matters. Heres an overview of the Map data structure in JavaScript, its methods, and their time complexities:

Map Methods:

a. set(key, value): Adds a new key-value pair to the map or updates the value for an existing key.
b. get(key): Returns the value associated with the specified key, or undefined if the key is not found.
c. has(key): Returns a Boolean indicating whether the map contains the specified key.
d. delete(key): Removes the key-value pair associated with the specified key.
e. clear(): Removes all key-value pairs from the map.
f. size: Returns the number of key-value pairs in the map.

Time Complexity of Map Methods:

Adding a key-value pair (set): O(1) - Adding a key-value pair to a map has constant time complexity on average.
Retrieving a value by key (get): O(1) - Accessing the value associated with a specific key in a map has constant time complexity on average.
Checking if a key exists (has): O(1) - Checking for the presence of a key in a map has constant time complexity on average.
Deleting a key-value pair (delete): O(1) - Removing a key-value pair from a map has constant time complexity on average.
Clearing the map (clear): O(1) - Clearing all key-value pairs from a map has constant time complexity.
Getting the size (size): O(1) - Retrieving the number of key-value pairs in a map has constant time complexity.
Valid Information on the Map Data Structure in JavaScript:

Maps in JavaScript allow you to use any data type as keys, including primitive data types, objects, and even functions.
Maps preserve the insertion order of elements, making them suitable for use cases where maintaining order is important.
Unlike objects, Maps do not automatically convert keys to strings, so you can use complex objects or even functions as keys without worrying about them being converted to strings.
Maps are iterable, which means you can use loops or methods like forEach to iterate over the key-value pairs.
Example:

javascript
Copy code
const myMap = new Map();

// Adding key-value pairs
myMap.set('name', 'John Doe');
myMap.set(1, 'one');
myMap.set(true, 'yes');

// Retrieving values
console.log(myMap.get('name')); // Output: 'John Doe'
console.log(myMap.get(1)); // Output: 'one'

// Checking if a key exists
console.log(myMap.has(true)); // Output: true
console.log(myMap.has('age')); // Output: false

// Getting the size
console.log(myMap.size); // Output: 3

// Deleting a key-value pair
myMap.delete(1);
console.log(myMap.has(1)); // Output: false

// Clearing the map
myMap.clear();
console.log(myMap.size); // Output: 0
  
Maps are useful when you need to store and access data with key-value associations while preserving the insertion order. They provide a flexible and efficient way to manage and access data, especially when the keys are not limited to strings or have specific constraints. Maps are part of the ECMAScript 6 (ES6) standard and are natively supported in modern JavaScript environments.






