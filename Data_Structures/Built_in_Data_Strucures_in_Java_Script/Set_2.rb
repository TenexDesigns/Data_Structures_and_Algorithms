JavaScript Sets are a type of collection that allows you to store unique values of any type. What distinguishes Sets from other JavaScript data structures is that they only store unique values - no duplicates are allowed.

Here are the main methods associated with Sets:

new Set(): Creates a new Set.
add(): Adds a new element to the Set. If the element already exists, it wont be added again.
delete(): Removes an element from a Set.
has(): Returns true if a value exists in the Set.
clear(): Removes all elements from a Set.
forEach(): Invokes a callback function for each element in the Set.
values(): Returns an Iterator with all the values in a Set.
keys(): This method is the same as values() for Sets, as Sets dont have keys like Maps do.
entries(): Returns an Iterator with the [value,value] pairs from a Set.
Sets also have a size property that returns the number of elements in the Set.

Here are examples of these methods in action:

// Create a Set
const letters = new Set();

// Add values to the Set
letters.add("a");
letters.add("b");
letters.add("c");

// Check if a value exists
console.log(letters.has("a"));  // Returns true

// Check the size of the Set
console.log(letters.size);  // Returns 3

// Delete a value
letters.delete("a");

// Iterate over the Set
letters.forEach((value) => {
  console.log(value);
});
One interesting characteristic of Sets is that the keys() and entries() methods dont behave as they do with Maps. Because Sets dont have keys (only values), the keys() method returns the same as values(). Similarly, entries() returns [value,value] pairs instead of [key,value] pairs like Maps do.

Heres an example of using entries():

// Create an Iterator
const myIterator = letters.entries();

// Iterate over the entries
for (const entry of myIterator) {
  console.log(entry);  // Logs ['b', 'b'], ['c', 'c']
}
In this example, the entries are pairs of the same value because Sets dont have keys levelup.gitconnected.com.









  ...
