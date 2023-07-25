Array

An array is a dtat strucure that can hold a collection values.

Arrays can contain a mix of different data types. You can store strings, boooleans , numbers or even objects all in the same array.
  Arrays are resizeable. You dont have to declare the size of an array before creating it

Javascript are zero-indexed and the insertion order is maintained.

Arrays are iterables. They can be used with a for loop.


  Array Big-O complexity

Insert / Remove from end  - 0(1)
Insert / Remove from begining  - 0(n)
Access - 0(1)
Search - 0(n)


  Push/Pop - 0(1)
  Shift /Unshift /Concat / Slice /Splice - 0(n)
  forEach/ map / filter /reduce - 0(n)
  



  MORE EXPLANANTION
------------------------------------------------------------------------------------------------------------------------------------------------

  In JavaScript, an array is a dynamic data structure used to store a collection of elements. It is one of the most commonly used data structures and provides 
    several built-in methods for performing various operations. Heres an overview of the array data structure in JavaScript, its methods, and their time complexities:

Array Methods:

a. push(): Adds one or more elements to the end of an array.
b. pop(): Removes the last element from an array and returns it.
c. unshift(): Adds one or more elements to the beginning of an array.
d. shift(): Removes the first element from an array and returns it.
e. splice(): Adds or removes elements from an array at a specified index.
f. concat(): Joins two or more arrays and returns a new array.
g. slice(): Extracts a portion of an array and returns a new array.
h. indexOf(): Returns the first index at which a specified element is found.
i. lastIndexOf(): Returns the last index at which a specified element is found.
j. includes(): Determines whether an array includes a certain element.
k. join(): Joins all elements of an array into a string.
l. reverse(): Reverses the order of the elements in an array.
m. sort(): Sorts the elements of an array.
n. forEach(): Executes a provided function once for each array element.
o. map(): Creates a new array with the results of calling a function on every element.
p. filter(): Creates a new array with elements that pass a test.
q. reduce(): Applies a function to reduce the array to a single value.

Time Complexity of Array Methods:

Access: O(1) - Arrays in JavaScript have direct access to elements by index, making access time constant.
Insertion/Deletion at the end: O(1) - Adding or removing elements from the end of an array takes constant time.
Insertion/Deletion at the beginning: O(n) - Adding or removing elements from the beginning of an array requires shifting elements, leading to linear time complexity.
Insertion/Deletion in the middle: O(n) - Adding or removing elements from the middle of an array requires shifting elements, leading to linear time complexity.
Search: O(n) - In the worst case, searching for an element may require visiting all elements, resulting in linear time complexity.
Valid Information on Array Data Structure in JavaScript:

JavaScript arrays are dynamic, meaning they can change in size dynamically as elements are added or removed.
Arrays in JavaScript can contain elements of different data types, as the array itself is a special type of object.
The length property of an array can be used to get or set the number of elements in the array.
Arrays in JavaScript are zero-indexed, meaning the first element is at index 0, the second element at index 1, and so on.
Example:

javascript
Copy code
const numbers = [1, 2, 3, 4, 5];

// Access
console.log(numbers[0]); // Output: 1

// Insertion
numbers.push(6); // [1, 2, 3, 4, 5, 6]

// Deletion
numbers.pop(); // [1, 2, 3, 4, 5]

// Search
console.log(numbers.indexOf(3)); // Output: 2

// Iteration using forEach
numbers.forEach((num) => console.log(num));
// Output:
// 1
// 2
// 3
// 4
// 5
Arrays are a fundamental data structure in JavaScript and are widely used in various programming tasks for their flexibility and ease of use.







  MORE EXPLANANTION
------------------------------------------------------------------------------------------------------------------------------------------------

    In JavaScript, arrays are a collection of elements or items. They are not primitives but are instead Array objects with some core characteristics developer.mozilla.org:

Arrays are resizable and can contain a mix of different data types.
They are not associative arrays, so elements cannot be accessed using arbitrary strings as indexes, but must be accessed using nonnegative integers (or their respective string form) as indexes.
Arrays are zero-indexed: the first element of an array is at index 0, the second is at index 1, and so on — and the last element is at the value of the arrays length property minus 1.
Array-copy operations create shallow copies.
Heres a simple example of how to declare an array in JavaScript and access elements:

const arr = ['a', 'b', 'c', 'd'];
console.log(arr[0]); // Outputs: c
freecodecamp.org

Arrays in JavaScript come with many built-in methods for different purposes, like adding or deleting items from the array, sorting it, filtering its values, and so on. Some of the most commonly used array methods include:

push(): Adds new items to the end of an array, and returns the new length. This method changes the length of the array.
pop(): Removes the last element from an array and returns that element. This method changes the length of the array.
shift(): Removes the first element from an array and returns that removed element. This method changes the length of the array.
unshift(): Adds one or more elements to the beginning of an array and returns the new length of the array.
splice(): Changes the contents of an array by removing or replacing existing elements and/or adding new elements in place.
slice(): Returns a shallow copy of a portion of an array into a new array object selected from start to end (end not included) where start and end represent the index of items in that array. The original array will not be modified.
For example:

const arr = ['a', 'b', 'c', 'd'];
arr.push('e'); // Adds 'e' to the end of the array
console.log(arr); // Outputs: ['a', 'b', 'c', 'd', 'e']
developer.mozilla.org

As for time complexity, it depends on the operation:

Accessing an item (by index) in an array is a constant time operation, O(1).
Searching for an item in an array is a linear time operation, O(n), in the worst case.
Inserting or deleting an item can be O(1) if at the end of the array, but its O(n) if anywhere else because all the other items need to be shifted.
Methods like map(), filter(), reduce(), forEach(), etc., that iterate over the entire array have a time complexity of O(n) because they touch every element once.
Its important to note that these are average cases and actual performance can depend on various factors like the JavaScript engine, available memory, and more freecodecamp.org.
  
