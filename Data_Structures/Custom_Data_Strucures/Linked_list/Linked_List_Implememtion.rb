Implementation of LinkedList in Javascript:

In this article, we will be implementing the LinkedList data structure in Javascript. LinkedList is a dynamic data structure, as we can add or remove elements at ease, and it can even grow as needed. Just like arrays, linked lists store elements sequentially, but they don't store the elements contiguously like an array.

Now, Let's see an example of a Linked List Node:

javascript
Copy code
// User-defined class node
class Node {
  // constructor
  constructor(element) {
    this.element = element;
    this.next = null;
  }
}
As shown above, we define a class Node having two properties: element and next. Element holds the data of a node while next holds the pointer to the next node, which is initialized to the null value.

Now, lets see an implementation of the LinkedList class:

javascript
Copy code
// linkedlist class
class LinkedList {
  constructor() {
    this.head = null;
    this.size = 0;
  }

  // functions to be implemented
  // add(element)
  // insertAt(element, location)
  // removeFrom(location)
  // removeElement(element)

  // Helper Methods
  // isEmpty
  // size_Of_List
  // printList
}
The above example shows a Linked List class with a constructor and a list of methods to be implemented. The Linked List class has two properties: head and size, where the head stores the first node of a List, and size indicates the number of nodes in a list.

Lets implement each of these functions:

1.add(element):
  It adds an element at the end of the list.

// adds an element at the end
// of the list
add(element) {
  // creates a new node
  const node = new Node(element);

  // to store the current node
  let current;

  // if the list is empty, add the
  // element and make it head
  if (this.head === null)
    this.head = node;
  else {
    current = this.head;

    // iterate to the end of the
    // list
    while (current.next) {
      current = current.next;
    }

    // add node
    current.next = node;
  }
  this.size++;
}
In order to add an element at the end of the list, we consider the following:

If the list is empty, then add an element and set it as the head.
If the list is not empty, then iterate to the end of the list and add an element at the end.


  
2.insertAt(element, index): 
It inserts an element at the given index in the list.

// insert element at the position index
// of the list
insertAt(element, index) {
  if (index < 0 || index > this.size)
    return console.log("Please enter a valid index.");
  else {
    // creates a new node
    const node = new Node(element);
    let current, prev;

    current = this.head;

    // add the element to the
    // first index
    if (index === 0) {
      node.next = this.head;
      this.head = node;
    } else {
      current = this.head;
      let it = 0;

      // iterate over the list to find
      // the position to insert
      while (it < index) {
        it++;
        prev = current;
        current = current.next;
      }

      // adding an element
      node.next = current;
      prev.next = node;
    }
    this.size++;
  }
}
In order to add an element at the given index of the list, we consider three conditions as follows:

If the index is zero, we add an element at the front of the list and make it the head.
If the index is the last position of the list, we append the element at the end of the list.
If the index is between 0 and size - 1, we iterate over to the index and add an element at that index.


    
3.removeFrom(index):
    It removes and returns an element from the list from the specified index.

// removes an element from the
// specified location
removeFrom(index) {
  if (index < 0 || index >= this.size)
    return console.log("Please Enter a valid index");
  else {
    let current, prev, it = 0;
    current = this.head;
    prev = current;

    // deleting the first element
    if (index === 0) {
      this.head = current.next;
    } else {
      // iterate over the list to the
      // position to remove an element
      while (it < index) {
        it++;
        prev = current;
        current = current.next;
      }

      // remove the element
      prev.next = current.next;
    }
    this.size--;

    // return the removed element
    return current.element;
  }
}
In order to remove an element from the list, we consider three conditions:

If the index is 0, then we remove the head and make the next node the head of the list.
If the index is size - 1, then we remove the last element from the list and make the previous node the last element.
If its in between 0 to size - 1, we remove the element using the previous and current node.



4.removeElement(element):
      This method removes the element from the list. It returns the removed element, or if its not found, it returns -1.

// removes a given element from the
// list
removeElement(element) {
  let current = this.head;
  let prev = null;

  // iterate over the list
  while (current !== null) {
    // comparing the element with the current
    // element if found then remove it
    // and return true
    if (current.element === element) {
      if (prev === null) {
        this.head = current.next;
      } else {
        prev.next = current.next;
      }
      this.size--;
      return current.element;
    }
    prev = current;
    current = current.next;
  }
  return -1;
}
The above method is just a modification of removeFrom(index), as it searches for an element and removes it, rather than removing it from a specified location.


  
Helper Methods:

Lets declare some helper methods which are useful while working with LinkedList.

5.indexOf(element):
    
    It returns the index of a given element if the element is in the list.

// finds the index of element
indexOf(element) {
  let count = 0;
  let current = this.head;

  // iterate over the list
  while (current !== null) {
    // compare each element of the list
    // with the given element
    if (current.element === element)
      return count;
    count++;
    current = current.next;
  }

  // not found
  return -1;
}
In this method, we iterate over the list to find the index of an element. If it is not present in the list, it returns -1 instead.


6.isEmpty(): 
      This method checks if the linked list is empty. It does this by checking if the size of the list is equal to 0. If it is, it means there are no elements in the list, so it returns true. Otherwise, it returns false.

  isEmpty() {
    return this.size === 0;
}

    
7.size_of_list(): 
    This method returns the size of the list, which is stored in the size property of the LinkedList class. It logs the size to the console.

  size_of_list() {
    console.log(this.size);
}


      
8.printList():
      This method prints all the elements of the list. It starts from the head of the list and goes through each element by following the next pointers of the nodes. It adds each element to a string, which is then logged to the console.

printList() {
    let curr = this.head;
    let str = "";
    while (curr) {
        str += curr.element + " ";
        curr = curr.next;
    }
    console.log(str);
      
}

  
These methods are helper methods that provide basic functionality for interacting with the linked list. They can be used in conjunction with the other methods to manipulate and interact with the linked list.
In conclusion, these are the fundamental methods you would implement for a linked list in JavaScript. Understanding these methods is key to understanding how linked lists work. Its also important to remember that linked lists have a time complexity of O(n) for access and search, but a time complexity of O(1) for insertions and deletions.




















  
