Sure! Here are some problems, solutions, and applications of linked lists with code samples:

1.Problem 1: Implement a Stack using a Linked List
Solution:

javascript
Copy code
class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.size = 0;
  }

  isEmpty() {
    return this.size === 0;
  }

  push(value) {
    const newNode = new Node(value);
    newNode.next = this.top;
    this.top = newNode;
    this.size++;
  }

  pop() {
    if (this.isEmpty()) {
      return null;
    }
    const poppedValue = this.top.value;
    this.top = this.top.next;
    this.size--;
    return poppedValue;
  }

  peek() {
    return this.isEmpty() ? null : this.top.value;
  }

  getSize() {
    return this.size;
  }
}

// Usage example
const stack = new Stack();
stack.push(10);
stack.push(20);
stack.push(30);
console.log(stack.pop()); // Output: 30
console.log(stack.peek()); // Output: 20
console.log(stack.getSize()); // Output: 2
Application: Linked lists are widely used to implement stack data structures, where elements are added and removed from the top (head) of the list in constant time complexity (O(1)).






  
2.Problem 2: Implement a Queue using a Linked List
Solution:

javascript
Copy code
class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Queue {
  constructor() {
    this.front = null;
    this.rear = null;
    this.size = 0;
  }

  isEmpty() {
    return this.size === 0;
  }

  enqueue(value) {
    const newNode = new Node(value);
    if (this.isEmpty()) {
      this.front = newNode;
      this.rear = newNode;
    } else {
      this.rear.next = newNode;
      this.rear = newNode;
    }
    this.size++;
  }

  dequeue() {
    if (this.isEmpty()) {
      return null;
    }
    const dequeuedValue = this.front.value;
    this.front = this.front.next;
    this.size--;
    return dequeuedValue;
  }

  getFront() {
    return this.isEmpty() ? null : this.front.value;
  }

  getRear() {
    return this.isEmpty() ? null : this.rear.value;
  }

  getSize() {
    return this.size;
  }
}

// Usage example
const queue = new Queue();
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);
console.log(queue.dequeue()); // Output: 10
console.log(queue.getFront()); // Output: 20
console.log(queue.getRear()); // Output: 30
console.log(queue.getSize()); // Output: 2
Application: Linked lists are widely used to implement queue data structures, where elements are added at the rear and removed from the front of the list in constant time complexity (O(1)).









    
3.Problem 3: Detect Loop in a Linked List
Solution:

javascript
Copy code
class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

function detectLoop(head) {
  let slow = head;
  let fast = head;
  while (fast && fast.next) {
    slow = slow.next;
    fast = fast.next.next;
    if (slow === fast) {
      return true;
    }
  }
  return false;
}

// Usage example
const head = new Node(1);
head.next = new Node(2);
head.next.next = new Node(3);
head.next.next.next = new Node(4);
head.next.next.next.next = head; // Create a loop
console.log(detectLoop(head)); // Output: true
Application: Linked lists can be used to detect cycles or loops in data structures such as graphs or linked lists.







  
4.Problem 4: Merge Two Sorted Linked Lists
Solution:

javascript
Copy code
class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

function mergeLists(list1, list2) {
  let mergedList = new Node(-1);
  let current = mergedList;

  while (list1 && list2) {
    if (list1.value <= list2.value) {
      current.next = list1;
      list1 = list1.next;
    } else {
      current.next = list2;
      list2 = list2.next;
    }
    current = current.next;
  }

  if (list1) {
    current.next = list1;
  } else {
    current.next = list2;
  }

  return mergedList.next;
}

// Usage example
const list1 = new Node(1);
list1.next = new Node(3);
list1.next.next = new Node(5);

const list2 = new Node(2);
list2.next = new Node(4);
list2.next.next = new Node(6);

console.log(mergeLists(list1, list2)); // Output: Node { value: 1, next: Node { value: 2, next: Node { value: 3, next: Node { value: 4, next: Node { value: 5, next: Node { value: 6, next: null } } } } } }
Application: Linked lists can be used to merge two sorted lists efficiently in linear time complexity (O(n)).

These are just a few examples of how linked lists can be applied and used to solve various problems and implement data structures in computer science and software engineering. Linked lists are valuable for scenarios where dynamic data structures are required, and efficient insertion and deletion operations are crucial.




