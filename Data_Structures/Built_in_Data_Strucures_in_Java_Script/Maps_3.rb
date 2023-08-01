JavaScript Maps are a type of collection that allows the storage of key-value pairs where the keys can be of any data type. This is a feature that differentiates them from JavaScript objects, where keys have to be either strings or symbols. Additionally, Maps preserve the insertion order of keys, which means when iterating over a Map, keys will be returned in the order they were added. They also have a size property that returns the number of elements in the Map.

Maps come with several methods for manipulating and accessing their data:

new Map(): Creates a new Map object.
set(): Sets the value for a key in a Map. This can also be used to change existing Map values.
get(): Gets the value for a key in a Map.
clear(): Removes all the elements from a Map.
delete(): Removes a Map element specified by a key.
has(): Returns true if a key exists in a Map.
forEach(): Invokes a callback for each key/value pair in a Map.
entries(): Returns an iterator object with the [key, value] pairs in a Map.
keys(): Returns an iterator object with the keys in a Map.
values(): Returns an iterator object of the values in a Map.
Here are some examples of how to use these methods:

// Create a Map
const fruits = new Map();

// Set Map Values
fruits.set("apples", 500);
fruits.set("bananas", 300);
fruits.set("oranges", 200);

// Get a value
console.log(fruits.get("apples"));  // Returns 500

// Check the size of the Map
console.log(fruits.size);  // Returns 3

// Check if a key exists
console.log(fruits.has("apples"));  // Returns true

// Delete a key
fruits.delete("apples");

// Iterate over the Map
fruits.forEach((value, key) => {
  console.log(`${key}: ${value}`);
});
One important feature of Maps is that they can use objects as keys. Heres an example:

// Create Objects
const apples = {name: 'Apples'};
const bananas = {name: 'Bananas'};
const oranges = {name: 'Oranges'};

// Create a Map
const fruits = new Map();

// Add new Elements to the Map
fruits.set(apples, 500);
fruits.set(bananas, 300);
fruits.set(oranges, 200);

// Get a value using an object as a key
console.log(fruits.get(apples));  // Returns 500
In this example, the keys are actual objects, not strings. This means that fruits.get("apples") would return undefined, but fruits.get(apples) (where apples is an object) would return 500 educative.io.

