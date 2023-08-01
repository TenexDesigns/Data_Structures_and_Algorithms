A stack is a linear data structure that follows a particular order in which the operations are performed. The order may be LIFO(Last In First Out) or FILO(First In Last Out). Mainly the following three basic operations are performed in the stack:

Push: Adds an item in the stack. If the stack is full, then it is said to be an Overflow condition.
Pop: Removes an item from the stack. The items are popped in the reversed order in which they are pushed. If the stack is empty, then it is said to be an Underflow condition.
Peek or Top: Returns the top element of the stack.
isEmpty: Returns true if the stack is empty, else false.
Here is a simple implementation of a Stack using a Linked List in JavaScript:

class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  peek() {
    return this.top;
  }

  push(value) {
    const newNode = new Node(value);
    if (this.length === 0) {
      this.top = newNode;
      this.bottom = newNode;
    } else {
      const holdingPointer = this.top;
      this.top = newNode;
      this.top.next = holdingPointer;
    }
    this.length++;
    return this;
  }

  pop() {
    if (!this.top) {
      return null;
    }
    if (this.top === this.bottom) {
      this.bottom = null;
    }
    const holdingPointer = this.top;
    this.top = this.top.next;
    this.length--;
    return this;
  }

  isEmpty() {
    return this.length === 0;
  }
}

const myStack = new Stack();
myStack.push('google');
myStack.push('udemy');
myStack.push('discord');
myStack.peek();
myStack.pop();
myStack.pop();
myStack.pop();
In this code, we have a Node class that represents a node in the linked list. Each node has a value and a next pointer to the next node in the list.

The Stack class represents a stack data structure. It has a top pointer to the top node in the stack, a bottom pointer to the bottom node in the stack, and a length property to keep track of the number of nodes in the stack. It includes methods for adding nodes to the stack (push), removing nodes from the stack (pop), checking the top node of the stack (peek), and checking if the stack is empty (isEmpty).

The push operation adds a new node at the top of the stack. If the stack is empty, the new node becomes both the top and bottom node. Otherwise, the new node becomes the new top node and its next pointer points to the previous top node.

The pop operation removes the top node from the stack. If the stack is empty, it returns null. If the stack has only one node, it removes the node and sets the bottom pointer to null. Otherwise, it removes the top node and sets the top pointer to the next node.

The peek operation returns the top node of the stack.

The isEmpty operation checks if the stack is empty by checking if the length property is 0.

The example usage of the stack shows how to use these operations. It creates a new stack, pushes some elements onto it, peeks at the top element, pops all elements from the stack, and checks if the stack is empty.

 
