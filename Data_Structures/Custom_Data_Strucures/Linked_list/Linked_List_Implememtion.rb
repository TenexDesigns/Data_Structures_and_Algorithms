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








in the above context also explain with code samples how to preppend and append an elemt, search for an elemt in liked ist, do reverser  in linked list, what tail and head for apprendind prepeding, liked list stack and queue
----------------------------------------------------------------------------------------------------------------------------------------
    

  Sure! Lets add the implementations for appending, prepending, searching, reversing a linked list, and explain tail and head concepts for appending and prepending. Well also discuss linked list as a stack and queue.

1.Append an Element (Add to the End):
      
Appending an element means adding it at the end of the linked list. To do this, we can traverse the list until we reach the last node and then add the new element as the next of the last node.

javascript
Copy code
// linkedlist class
class LinkedList {
    // ... (existing code)

    // Append an element to the end of the list
    append(element) {
        const node = new Node(element);
        if (!this.head) {
            this.head = node;
        } else {
            let current = this.head;
            while (current.next) {
                current = current.next;
            }
            current.next = node;
        }
        this.size++;
    }
}

// Test appending an element to the linked list
const ll = new LinkedList();
ll.add(10);
ll.add(20);

// Output: 10 20
ll.printList();

ll.append(30);
ll.append(40);

// Output: 10 20 30 40
ll.printList();



      
2.Prepend an Element (Add to the Beginning):
Prepending an element means adding it at the beginning of the linked list. To do this, we can make the new node the new head and point its next to the current head.

javascript
Copy code
// linkedlist class
class LinkedList {
    // ... (existing code)

    // Prepend an element to the beginning of the list
    prepend(element) {
        const node = new Node(element);
        node.next = this.head;
        this.head = node;
        this.size++;
    }
}

// Test prepending an element to the linked list
const ll = new LinkedList();
ll.add(20);
ll.add(30);

// Output: 20 30
ll.printList();

ll.prepend(10);

// Output: 10 20 30
ll.printList();





  
3.Search for an Element in the Linked List:
  
Searching for an element in the linked list involves traversing the list and comparing each nodes element with the target element until a match is found.

javascript
Copy code
// linkedlist class
class LinkedList {
    // ... (existing code)

    // Search for an element in the list
    search(element) {
        let current = this.head;
        while (current) {
            if (current.element === element) {
                return true;
            }
            current = current.next;
        }
        return false;
    }
}

// Test searching for an element in the linked list
const ll = new LinkedList();
ll.add(10);
ll.add(20);
ll.add(30);

console.log(ll.search(20)); // Output: true
console.log(ll.search(40)); // Output: false





  
4.Reverse the Linked List:
Reversing the linked list involves changing the direction of the next pointers of each node. We start by storing the previous, current, and next nodes while iterating through the list and update the next pointers accordingly.

javascript
Copy code
// linkedlist class
class LinkedList {
    // ... (existing code)

    // Reverse the list
    reverse() {
        let prev = null;
        let current = this.head;
        while (current) {
            const next = current.next;
            current.next = prev;
            prev = current;
            current = next;
        }
        this.head = prev;
    }
}

// Test reversing the linked list
const ll = new LinkedList();
ll.add(10);
ll.add(20);
ll.add(30);

// Output: 30 20 10
ll.reverse();
ll.printList();








  
5.Tail and Head Concepts for Appending and Prepending:
  
In the context of linked lists, the tail refers to the last node of the list, and the head refers to the first node of the list. By maintaining references to the head and optionally the tail, we can easily perform operations like appending and prepending.

In the existing LinkedList class, head is already used to keep track of the first node. However, to efficiently append elements without traversing the entire list every time, we can also keep track of the tail. Heres how we can do it:

javascript
Copy code
// linkedlist class
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null; // Keep track of the tail
        this.size = 0;
    }

    // Append an element to the end of the list
    append(element) {
        const node = new Node(element);
        if (!this.head) {
            this.head = node;
            this.tail = node;
        } else {
            this.tail.next = node;
            this.tail = node;
        }
        this.size++;
    }
}

// Test appending an element to the linked list with tail
const ll = new LinkedList();
ll.add(10);
ll.add(20);

// Output: 10 20
ll.printList();

ll.append(30);
ll.append(40);

// Output: 10 20 30 40
ll.printList();






  
6.Linked List as a Stack and Queue:
A linked list can be used to implement both a stack and a queue efficiently.

(a) -----> Linked List as a Stack:
For a stack, we can use the prepend() method to push elements onto the stack (add to the top) and the removeFrom(0) method to pop elements from the stack (remove from the top).
javascript
Copy code
// linkedlist class
class LinkedList {
    // ... (existing code)

    // Implementing Linked List as a Stack
    push(element) {
        this.prepend(element);
    }

    pop() {
        return this.removeFrom(0);
    }
}

// Test Linked List as a Stack
const stack = new LinkedList();
stack.push(10);
stack.push(20);
stack.push(30);

console.log(stack.pop()); // Output: 30
console.log(stack.pop()); // Output: 20
console.log(stack.pop()); // Output: 10





  
(b) ------> Linked List as a Queue:
For a queue, we can use the append() method to enqueue elements (add to the rear) and the removeFrom(0) method to dequeue elements (remove from the front).
javascript
Copy code
// linkedlist class
class LinkedList {
    // ... (existing code)

    // Implementing Linked List as a Queue
    enqueue(element) {
        this.append(element);
    }

    dequeue() {
        return this.removeFrom(0);
    }
}

// Test Linked List as a Queue
const queue = new LinkedList();
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);

console.log(queue.dequeue()); // Output: 10
console.log(queue.dequeue()); // Output: 20
console.log(queue.dequeue()); // Output: 30
With these implementations, you now have a fully functional Linked List class with methods for appending, prepending, searching, reversing, and using it as a stack and queue. You can use these methods to build more complex data structures and solve various problems that require linked lists.















  
