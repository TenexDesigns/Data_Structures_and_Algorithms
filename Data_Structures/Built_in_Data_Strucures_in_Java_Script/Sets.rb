

SET

A set is a data strucure that can  hold a collection of values.
  The values however must be unique.

Set can contain  a mix of different data types. You can store strings, booleans, numbers or even objects all in the same set.

Sets are dynamically sized. You dont have to declare the size of a set before creating  it.
  Sets do not maintain an insertion order.
      Sets are iterables. They can  be used with a for of loop.



SETS VS ARRAYS

        Arrays can contain duplicate values wheres sets cannot.
          Insertion order is maintained in arrys but it is not the case with sets.
              Searching and deleting  an element in the  set is faster compared to arrays.




            
In JavaScript, a Set is a data structure that stores a collection of unique values. Unlike arrays, sets do not allow duplicate elements, making them useful when you need to store a unique set of values. Heres an overview of the Set data structure in JavaScript, its methods, and their time complexities:

Set Methods:

a. add(value): Adds a new element with the given value to the set.
b. delete(value): Removes the specified value from the set.
c. has(value): Returns a Boolean indicating whether the set contains the specified value.
d. clear(): Removes all elements from the set.
e. size: Returns the number of elements in the set.

Time Complexity of Set Methods:

Adding an element (add): O(1) - Adding an element to a set has constant time complexity on average.
Deleting an element (delete): O(1) - Removing an element from a set has constant time complexity on average.
Checking if an element exists (has): O(1) - Checking for the presence of an element in a set has constant time complexity on average.
Clearing the set (clear): O(1) - Clearing all elements from a set has constant time complexity.
Getting the size (size): O(1) - Retrieving the number of elements in a set has constant time complexity.
Valid Information on the Set Data Structure in JavaScript:

Sets in JavaScript store unique values, meaning each value can only occur once in the set.
Sets can store values of any data type, including primitive data types and objects.
Sets are iterable, which means you can use loops or methods like forEach to iterate over the elements.
The order of elements in a Set is based on the insertion order, but Sets are not indexed like arrays.
Example:

javascript
Copy code
const mySet = new Set();

// Adding elements
mySet.add(1);
mySet.add(2);
mySet.add(3);
mySet.add(2); // Duplicate element, will not be added

// Checking if an element exists
console.log(mySet.has(2)); // Output: true
console.log(mySet.has(4)); // Output: false

// Getting the size
console.log(mySet.size); // Output: 3

// Deleting an element
mySet.delete(2);
console.log(mySet.has(2)); // Output: false

// Clearing the set
mySet.clear();
console.log(mySet.size); // Output: 0
Sets are helpful when you need to ensure that a collection of data contains unique values without duplicates. They are commonly used to remove duplicates from an array, check for the existence of elements, or perform set operations like union, intersection, and difference. Sets are part of the ECMAScript 6 (ES6) standard and are natively supported in modern JavaScript environments.







MORE EXPLANANTION
**********************************************************************************************************************************************************



    A Set in JavaScript is a collection of items where no element can be repeated. They are ordered, meaning that elements of the set can be iterated in the insertion order. A set can store any type of value, whether primitive or objects [3]. Here is an example of how to create and use a Set in JavaScript:

const s1 = new Set(); // Declaring set

// inserting elements in set
s1.add(10);
s1.add(5);
s1.add(12);
s1.add(4);

// printing elements of set
for (const i of s1) {
    console.log(i);
}

// check if 10 present inside the set
if (s1.has(10)) {
    console.log("Element is present in the set:");
}

// erasing 10 from the set
s1.delete(5);

// printing element of set
for (const it of s1) {
    console.log(it);
}

console.log("Minimum element: " + Math.min(...s1));
console.log("Maximum element: " + Math.max(...s1));
console.log("Size of the set is: " + s1.size); // Printing the size of the set
The above example demonstrates several methods available for a Set in JavaScript:

add(value): Adds a new element with the given value to the Set.
delete(value): Removes the specified element from the Set.
has(value): Returns a boolean indicating whether an element with the specified value exists in the Set or not.
size: This property returns the number of elements in the Set [3].
The Set data structure in JavaScript has sublinear time complexity on average, meaning that the time complexity is either O(1) or O(log(n)) [2]. This is because Set objects must be implemented using mechanisms, like hash tables or other structures, that provide access times that are sublinear on the number of elements in the collection [1].

An Array in JavaScript is a high-level, list-like object that is used to store ordered collections of data. Arrays are zero-indexed and have properties and methods like .length, .push(), .pop(), .shift(), .unshift(), .indexOf(), and many others [4].

Here is an example of how to create and use an Array in JavaScript:

// A collection of the values 1, 2 and 3
const arr = [1, 2, 3]

// Each value is related to one another, in the sense that each is indexed in a position of the array
const indexOfTwo = arr.indexOf(2)
console.log(arr[indexOfTwo-1]) // 1
console.log(arr[indexOfTwo+1]) // 3

// We can perform many operations on the array, like pushing new values into it
arr.push(4)
console.log(arr) // [1,2,3,4]
The time complexity of JavaScript array operations varies:

Access - O(1)
Insertion - O(n)
Deletion - O(n)
Searching - O(n)
This is because each element in an array is stored at a specific index. While accessing an element at a specific index is quick, operations like insertion, deletion, and searching require going through potentially all the elements in the array [0].













  

