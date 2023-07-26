Object


An object is an unordered collection of key-value pairs.
  The key must either be a string or symbol data type, where as the value can be any data type

To retrieve a value ,you can use the corresponding key.This can be achieved using the dot notation or bracket notation

An  object is not an iterable . You cannot use it with a for of loop




  Big O time Complexity of SOme methods in Javascript Objects


  Insert  - O(1)
  Remove  - O(1)
  Access  - O(1)
  Search  - O(n)
  Object.keys()  - O(n)
  Object.values()  - O(n)
  Object.entries()  - O(n)



  
In JavaScript, an object is a dynamic data structure that stores data in key-value pairs. Each value is associated with a unique key, 
  and objects are useful for representing real-world entities or structured data. Heres an overview of the object data structure in JavaScript, its methods, and their time complexities:

Object Methods:

a. Object.keys(): Returns an array containing all the keys of an object.
b. Object.values(): Returns an array containing all the values of an object.
c. Object.entries(): Returns an array containing all the key-value pairs of an object as arrays.
d. Object.assign(): Copies the values of all enumerable properties from one or more source objects to a target object.
e. Object.hasOwnProperty(): Returns a Boolean indicating whether an object has the specified property as a direct property of that object.
f. Object.freeze(): Freezes an object, preventing new properties from being added, and existing properties from being modified or removed.

Time Complexity of Object Methods:

Access: O(1) - Accessing a value by key in an object has constant time complexity as it directly retrieves the value using the key.
Insertion/Deletion: O(1) - Adding or removing key-value pairs in an object typically has constant time complexity, as it involves assigning or deleting properties by key.
Valid Information on the Object Data Structure in JavaScript:

Object keys must be unique and are usually strings or symbols. Values can be of any data type.
Objects in JavaScript are unordered collections, meaning there is no guaranteed order of the keys when iterating over an objects properties.
JavaScript objects are mutable, which means you can add, modify, or delete properties after the object is created.
You can use either dot notation or bracket notation to access the values of an object property.

    
Example:

const person = {
  name: 'John Doe',
  age: 30,
  email: 'john.doe@example.com',
};

// Access
console.log(person.name); // Output: 'John Doe'

// Insertion
person.gender = 'Male';
console.log(person); // Output: { name: 'John Doe', age: 30, email: 'john.doe@example.com', gender: 'Male' }

// Deletion
delete person.email;
console.log(person); // Output: { name: 'John Doe', age: 30, gender: 'Male' }

// Object.keys()
console.log(Object.keys(person)); // Output: ['name', 'age', 'gender']

// Object.values()
console.log(Object.values(person)); // Output: ['John Doe', 30, 'Male']

// Object.entries()
console.log(Object.entries(person));
// Output:
// [['name', 'John Doe'], ['age', 30], ['gender', 'Male']]

// Object.hasOwnProperty()
console.log(person.hasOwnProperty('name')); // Output: true
console.log(person.hasOwnProperty('address')); // Output: false

// Object.freeze()
Object.freeze(person);
person.age = 31; // Modification is ignored
console.log(person.age); // Output: 30
    
Objects are widely used in JavaScript for representing complex data structures and modeling real-world entities. They provide a flexible and powerful way to organize and access data using key-value pairs.









MORE EXPLANANTION
******************************************************************************************************************************************************************


  JavaScript Objects are a fundamental part of the language and are the building blocks of modern JavaScript. They are used to store various keyed collections and more complex entities. Objects can be created using the Object() constructor or the object literal syntax. Here is an example of how to create an object in JavaScript [0][1]:

let school = {
    name: 'Vivekananda School',
    location : 'Delhi',
    established : '1971',
    displayInfo : function(){
        console.log(`${this.name} was established in ${this.established} at ${this.location}`);
    }
}
school.displayInfo();
In this example, name, location, and established are keys and Vivekananda School, Delhi and 1971 are the values of these keys respectively. Each of these keys is referred to as properties of the object. An object in JavaScript may also have a function as a member, in which case it will be known as a method of that object. Here displayInfo is a method of the school object [1].

Objects in JavaScript are reference data types. Variables that are assigned a reference value are given a reference or a pointer to that value. That reference or pointer points to the location in memory where the object is stored. The variables don’t actually store the value [1].

Loosely speaking, objects in JavaScript may be defined as an unordered collection of related data, of primitive or reference types, in the form of “key: value” pairs. These keys can be variables or functions and are called properties and methods, respectively, in the context of an object [1].

JavaScript object properties can be strings or numbers. In case the property names are numbers, they must be accessed using the “bracket notation” [1].

JavaScript is designed on a simple object-based paradigm. An object is a collection of properties, and a property is an association between a name (or key) and a value. A propertys value can be a function, in which case the property is known as a method [2].

JavaScript objects can have properties, which define their characteristics. In addition to objects that are predefined in the browser, you can define your own objects [2].

Regarding the Big O notation of JavaScript object methods, it can vary depending on the specific operation:

Accessing a property or method: O(1)
Adding or removing a property or method: O(1)
Searching for a value: O(n)
This is because JavaScript objects are implemented as hash tables [3].


































  
