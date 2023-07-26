
Queue


The queue data strucure is a sequential collection of elemnts that follows the principle of First In First Out

The first elemnt inserted into the queue is first elemnt to be removed




 Analogy -----> A queueu of people . Peoople eneter the queueu at one end  and then leave the queuue from the other end

Queue is an abstract data type. It is defined by its behaviour rather than being a mathematical model


The Queueu data struture supports two main operations
Enquque - which adds an element  to  the  end of the collection
Dequeue - which removes an elemennt  from the head of collection




Queueu Usage

Prnaters
Cpu task schduling
Callback queueu in javavscript runtime



Quueue Implemention

enqueue(element) - add an element to the top of the stack
dequeuue() - remove the top most element from the stack
peek() - Get the value of the top element without removing it.
isEmpty() - Check if the stack is empty
size() - Get the number of elements in the statck
print() - Visualize the elements in the stack


MORE EXPLAANNTION
------------------------------------------------------------------------------------------------------------------------------------------------


 A queue is a linear data structure that follows the First In First Out (FIFO) principle. It means that the first element added to the queue will be the first one to be removed. Queues are used in various computer algorithms and applications, such as task scheduling, breadth-first search, and simulation of real-world scenarios.

In JavaScript, you can implement a queue using an array or by creating a custom Queue class. Below is an implementation of a queue in JavaScript with the specified methods:

javascript
Copy code
class Queue {
  constructor() {
    this.items = [];
  }

  enqueue(element) {
    this.items.push(element);
  }

  dequeue() {
    if (this.isEmpty()) {
      return "Queue is empty";
    }
    return this.items.shift();
  }

  peek() {
    if (this.isEmpty()) {
      return "Queue is empty";
    }
    return this.items[0];
  }

  isEmpty() {
    return this.items.length === 0;
  }

  size() {
    return this.items.length;
  }

  print() {
    console.log(this.items);
  }
}

// Example usage:
const myQueue = new Queue();
myQueue.enqueue(1);
myQueue.enqueue(2);
myQueue.enqueue(3);

myQueue.print(); // Output: [1, 2, 3]
console.log(myQueue.peek()); // Output: 1
console.log(myQueue.dequeue()); // Output: 1
console.log(myQueue.size()); // Output: 2
console.log(myQueue.isEmpty()); // Output: false
In the example above, we created a custom Queue class with the required methods: enqueue, dequeue, peek, isEmpty, size, and print. The enqueue method adds an element to the end of the queue (end of the array), the dequeue method removes the front element, the peek method returns the value of the front element without removing it, the isEmpty method checks if the queue is empty, the size method returns the number of elements in the queue, and the print method visualizes the elements in the queue.

While arrays can be used to implement a queue, creating a custom Queue class provides more control and encapsulation over the queue operations. It also allows you to add additional functionality or validation specific to the queue, making the code cleaner and easier to maintain. Using a queue is beneficial when you need to perform operations in a First In First Out (FIFO) manner and want to ensure that only specific methods are used for queue manipulation.













MORE EXPLAANNTION
------------------------------------------------------------------------------------------------------------------------------------------------


A queue is a data structure that follows the FIFO (First In, First Out) principle. This means that the first element added to the queue is the first one to be removed. Queues are used in various programming scenarios such as managing tasks in servers, handling requests in a web server, implementing cache and buffer functionalities, and in breadth-first search algorithms geeksforgeeks.org, scaler.com.

While JavaScript does not have a built-in Queue data structure, it can be easily implemented using arrays. Arrays provide methods like push() and shift() which can be used to add elements at the end of the queue and remove elements from the front of the queue respectively educba.com.

Here is an example of a Queue implementation in JavaScript that includes the methods enqueue(), dequeue(), peek(), isEmpty(), size(), and print():

class Queue {
    constructor() {
        this.items = [];
    }
    
    // add element to the end of the queue
    enqueue(element) {
        return this.items.push(element);
    }
    
    // remove the first element from the queue
    dequeue() {
        if(this.items.length > 0) {
            return this.items.shift();
        }
    }
    
    // get the value of the first element without removing it
    peek() {
        return this.items[0];
    }
    
    // check if the queue is empty
    isEmpty(){
       return this.items.length == 0;
    }
   
    // get the number of elements in the queue
    size(){
        return this.items.length;
    }
 
    // visualize the elements in the queue
    print(){
        console.log(this.items);
    }
}
You can use this Queue class as follows:

let queue = new Queue();
queue.enqueue(1);
queue.enqueue(2);
queue.enqueue(3);
queue.print(); // [1, 2, 3]
console.log(queue.dequeue()); // 1
console.log(queue.peek()); // 2
console.log(queue.isEmpty()); // false
console.log(queue.size()); // 2
The reason to use a queue instead of an array directly is that a queue provides a specific set of operations (FIFO) that are not inherently enforced by arrays. Using a queue makes your code more readable and self-explanatory, because it signals that you are using the FIFO principle learnersbucket.com.












