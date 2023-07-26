A circular queue, also known as a circular buffer, is a type of queue data structure in which the elements are stored in a fixed-size array. Instead of resizing the array or shifting elements when the queue becomes full or empty, a circular queue wraps around the array, effectively reusing the space.

Circular queues are used in scenarios where a fixed-size queue is required, and you want to efficiently utilize the available memory without the overhead of resizing or shifting elements.

To implement a circular queue in JavaScript, you can create a custom CircularQueue class with the following methods:

enqueue(element): Adds an element to the rear of the circular queue.
dequeue(): Removes the front element from the circular queue and returns it.
peek(): Returns the front element of the circular queue without removing it.
isEmpty(): Checks if the circular queue is empty.
isFull(): Checks if the circular queue is full.
getSize(): Returns the number of elements in the circular queue.
print(): Visualizes the elements in the circular queue.
Heres an implementation of a CircularQueue class in JavaScript:

class CircularQueue {
  constructor(capacity) {
    this.capacity = capacity;
    this.items = new Array(capacity);
    this.front = 0;
    this.rear = -1;
    this.size = 0;
  }

  enqueue(element) {
    if (this.isFull()) {
      return "Queue is full";
    }
    this.rear = (this.rear + 1) % this.capacity;
    this.items[this.rear] = element;
    this.size++;
  }

  dequeue() {
    if (this.isEmpty()) {
      return "Queue is empty";
    }
    const frontElement = this.items[this.front];
    this.front = (this.front + 1) % this.capacity;
    this.size--;
    return frontElement;
  }

  peek() {
    if (this.isEmpty()) {
      return "Queue is empty";
    }
    return this.items[this.front];
  }

  isEmpty() {
    return this.size === 0;
  }

  isFull() {
    return this.size === this.capacity;
  }

  getSize() {
    return this.size;
  }

  print() {
    if (this.isEmpty()) {
      console.log("Queue is empty");
    } else {
      let currentIndex = this.front;
      let result = [];
      for (let i = 0; i < this.size; i++) {
        result.push(this.items[currentIndex]);
        currentIndex = (currentIndex + 1) % this.capacity;
      }
      console.log(result);
    }
  }
}

// Example usage:
const myQueue = new CircularQueue(5);
myQueue.enqueue(1);
myQueue.enqueue(2);
myQueue.enqueue(3);

myQueue.print(); // Output: [1, 2, 3]
console.log(myQueue.peek()); // Output: 1
console.log(myQueue.dequeue()); // Output: 1
console.log(myQueue.getSize()); // Output: 2
console.log(myQueue.isEmpty()); // Output: false
    
In this implementation, we use the modulo operator % to ensure that the front and rear indices wrap around the array when they reach the end. This allows us to reuse the space efficiently, making the circular queue ideal for scenarios where a fixed-size queue is required.







MORE EXPLANANTION
*****************************************************************************************************************************************************************

  A Circular Queue is a linear data structure that follows the First In First Out (FIFO) principle but in a circular way, meaning that once the end of the queue is reached, the next element to be dequeued is the first element, if it has not been dequeued yet. This makes the Circular Queue a more efficient use of memory as it reuses the space of dequeued elements, unlike a regular queue medium.com.

A Circular Queue can be used in situations where memory management is crucial and systems that use round-robin scheduling, such as CPU scheduling, disk scheduling, or in any buffer operations like data packet buffering in communication networks where the connection is cyclic.

The main methods of a Circular Queue are:

enqueue(element): Adds an element to the end of the queue.
dequeue(): Removes an element from the front of the queue.
isEmpty(): Checks if the queue is empty.
getFront(): Returns the front element from the queue without removing it.
clear(): Clears the entire queue medium.com.
The implementation of a Circular Queue in JavaScript is as follows:

class CircularQueue {
    constructor(size) {
        this.element = [];
        this.size = size;
        this.length = 0;
        this.front = 0;
        this.back = -1;
    }
    
    isEmpty() {
        return this.length == 0;
    }
    
    enqueue(element) {
        if (this.length >= this.size) throw new Error("Maximum length exceeded");
        this.back++;
        this.element[this.back % this.size] = element;
        this.length++;
    }
    
    dequeue() {
        if (this.isEmpty()) throw new Error("No elements in the queue");
        const value = this.getFront();
        this.element[this.front % this.size] = null;
        this.front++;
        this.length--;
        return value;
    }
    
    getFront() {
        if (this.isEmpty()) throw new Error("No elements in the queue");
        return this.element[this.front % this.size];
    }
    
    clear() {
        this.element = new Array();
        this.length = 0;
        this.back = 0;
        this.front = -1;
    }
}
This implementation uses the modulo operation ('%') to find the exact position in the array for enqueue and dequeue operations, making it circular medium.com.








  
MORE EXPLANANTION
*****************************************************************************************************************************************************************



    A Circular Queue data structure in JavaScript refers to an advanced and efficient version of the queue data structure that follows the First In First Out (FIFO) principle. However, unlike a traditional queue where memory can be wasted when elements are removed (dequeued), the circular queue maximizes memory usage by utilizing the empty spaces at the front.

This characteristic creates a cyclic movement which implies, when you try to increment any pointer (front or rear), and if the location is the last of the array, the next element will be the first element of the array.

Circular queues are primarily employed in scenarios that benefit from memory optimization, such as system and process scheduling operations. For instance, round-robin scheduling algorithms often employ circular queues. It is also used in buffering operations, such as data packet buffering in communication networks etc.

The main methods involved in a Circular Queue data structure include:

enqueue(element): This method adds (enqueues) an element to the end of the queue. If the queue has reached its capacity, the element is added to the front of the queue.
dequeue(): This removes (dequeues) an element from the front of the queue. If the front of the queue directly points to the last element, the next call of dequeue() will remove the element pointed by rear (effectively making it circular!).
isEmpty(): This method allows you to check if the queue is empty.
getFront(): This method returns (peeks at) the first added (front-most) element from the queue without removing it.
clear(): This method is used to completely empty the queue.
Here is how you can implement a Circular Queue in JavaScript:

class CircularQueue{
    constructor(k) {
        this.queue = new Array(k);
        this.head = 0;
        this.tail = -1;
        this.size = 0;
    }
    
    enqueue(value) {
        if (this.size === this.queue.length) {
            return false;
        }
        this.tail = (this.tail + 1) % this.queue.length;
        this.queue[this.tail] = value;
        this.size++;
        return true;
    }
    
    dequeue() {
        if (this.size === 0) {
            return false;
        }
        this.queue[this.head] = undefined;
        this.head = (this.head + 1) % this.queue.length;
        this.size--;
        return true;
    }
    
    Front() {
      if(this.size === 0)
          return -1;
      return this.queue[this.head];       
    }
    
    Rear() {
      if (this.size === 0)
        return -1;
      return this.queue[this.tail];
    }
    
    isEmpty() {
      return this.size === 0;
    }

    isFull() {
      return this.size === this.queue.length;
    }

    clear() {
      this.queue = [];
      this.head = 0;
      this.tail = -1;
      this.size = 0;
    }
};
With the above class, you can create a Circular Queue of any size, k, add elements to it, remove elements from it, and be able to retrieve the front and rear elements among other operations while making the best use of memory. This is how the circular queue ensures that operations (enqueue and dequeue) remain constant, making the circular queue more useful than the regular queue when working with cycles or loops.

To summarize, use a Circular Queue when there is a necessity for a queue data structure, and there are inherent cyclic characteristics in the problem that can help optimize memory usage and ensure constant operation time.
















  


....
