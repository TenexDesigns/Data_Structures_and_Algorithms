Sure, lets explore some common problems and their solutions using linked lists:

1.Problem: 
Implement a stack using a linked list.
Solution:

class Node {
  constructor(data) {
    this.data = data;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
  }

  push(data) {
    const newNode = new Node(data);
    newNode.next = this.top;
    this.top = newNode;
  }

  pop() {
    if (!this.top) return null;
    const removedData = this.top.data;
    this.top = this.top.next;
    return removedData;
  }

  isEmpty() {
    return this.top === null;
  }
}

// Usage example
const stack = new Stack();
stack.push(1);
stack.push(2);
stack.push(3);
console.log(stack.pop()); // Output: 3
console.log(stack.isEmpty()); // Output: false
console.log(stack.pop()); // Output: 2




  
2.Problem:
  Implement a queue using a linked list.
Solution:

class Node {
  constructor(data) {
    this.data = data;
    this.next = null;
  }
}

class Queue {
  constructor() {
    this.front = null;
    this.rear = null;
  }

  enqueue(data) {
    const newNode = new Node(data);
    if (!this.front) {
      this.front = newNode;
      this.rear = newNode;
    } else {
      this.rear.next = newNode;
      this.rear = newNode;
    }
  }

  dequeue() {
    if (!this.front) return null;
    const removedData = this.front.data;
    this.front = this.front.next;
    return removedData;
  }

  isEmpty() {
    return this.front === null;
  }
}

// Usage example
const queue = new Queue();
queue.enqueue(1);
queue.enqueue(2);
queue.enqueue(3);
console.log(queue.dequeue()); // Output: 1
console.log(queue.isEmpty()); // Output: false
console.log(queue.dequeue()); // Output: 2


    
3.Problem:
    Reverse a linked list.
Solution:

class Node {
  constructor(data) {
    this.data = data;
    this.next = null;
  }
}

function reverseLinkedList(head) {
  let prev = null;
  let current = head;
  let nextNode;

  while (current !== null) {
    nextNode = current.next;
    current.next = prev;
    prev = current;
    current = nextNode;
  }

  return prev;
}

// Usage example
const node1 = new Node(1);
const node2 = new Node(2);
const node3 = new Node(3);

node1.next = node2;
node2.next = node3;

console.log("Original Linked List:");
let curr = node1;
while (curr !== null) {
  console.log(curr.data);
  curr = curr.next;
}

const reversedHead = reverseLinkedList(node1);

console.log("Reversed Linked List:");
curr = reversedHead;
while (curr !== null) {
  console.log(curr.data);
  curr = curr.next;
}


  
4.Problem:
  Merge two sorted linked lists into a single sorted linked list.
Solution:

javascript
Copy code
class Node {
  constructor(data) {
    this.data = data;
    this.next = null;
  }
}

function mergeSortedLinkedLists(list1, list2) {
  const dummyHead = new Node(null);
  let current = dummyHead;

  while (list1 !== null && list2 !== null) {
    if (list1.data < list2.data) {
      current.next = list1;
      list1 = list1.next;
    } else {
      current.next = list2;
      list2 = list2.next;
    }
    current = current.next;
  }

  if (list1 !== null) {
    current.next = list1;
  } else {
    current.next = list2;
  }

  return dummyHead.next;
}

// Usage example
const node1 = new Node(1);
const node2 = new Node(3);
const node3 = new Node(5);

node1.next = node2;
node2.next = node3;

const node4 = new Node(2);
const node5 = new Node(4);
const node6 = new Node(6);

node4.next = node5;
node5.next = node6;

const mergedHead = mergeSortedLinkedLists(node1, node4);

let curr = mergedHead;
while (curr !== null) {
  console.log(curr.data);
  curr = curr.next;
}

  
Linked lists have many other applications, and these are just a few examples. They are widely used in various data structures and algorithms, especially when dynamic data structures are required, and the size of the data can change frequently.





..
