A Circular Queue, also known as a Circular Buffer, is a type of queue data structure in which the last element is connected to the first element, forming a circular chain. It overcomes the limitation of a regular queue where, after the last element, new elements cannot be added even if there is space available at the front. In a circular queue, elements can be enqueued and dequeued in a circular fashion, hence the name.

Key properties of a Circular Queue:

It has a fixed size, and once the queue is full, adding more elements will overwrite the existing elements in a circular manner.
It maintains two pointers, "front" and "rear," to keep track of the first and last elements of the queue.


Circular queues are used in various scenarios, such as:

Memory Management: Circular queues can be used for managing memory in systems with limited memory resources, where the buffer size remains fixed, and new data overwrites the old data in a cyclic manner.

Task Scheduling: Circular queues can be used to manage task scheduling in real-time systems, where tasks are executed in a circular manner based on their priorities.

Printer Spooling: Circular queues are used to manage print job spooling, where print jobs are enqueued and dequeued in a circular manner, ensuring fairness in printer access.
clock:
Traffic Lighhts:
Sreaming_data  
  Printer Spooling: In computer systems, a circular queue can be used as a printer spooler to manage print jobs in a circular manner. Print jobs are enqueued to the spooler and dequeued one by one for printing. This ensures that the print jobs are processed in the order they were received.

CPU Scheduling: In operating systems, circular queues are used for CPU scheduling algorithms like Round Robin. Processes are placed in a circular queue, and the CPU executes each process for a fixed time slice before moving to the next process in the queue.

Buffer Management: Circular queues are commonly used for buffer management in communication systems. Data packets are placed in a circular buffer, and the oldest packets are dequeued to make space for new incoming packets.

Event Handling: In event-driven programming, circular queues can be used to manage events. Events are enqueued as they occur, and event handlers dequeue and process events from the queue.

Network Routing: In networking, circular queues are used in some routing algorithms to manage the forwarding of packets through different paths in a cyclic manner.

Circular Buffer in Audio Processing: Circular queues are utilized to implement circular buffers in audio processing applications. This allows continuous streaming and processing of audio data with minimal latency.

Job Scheduling: In job scheduling systems, circular queues can be employed to manage the execution of tasks or jobs in a cyclical order.




These are just a few examples of the many applications of circular queues. They are generally beneficial in scenarios where there is a need to efficiently manage and cycle through a fixed-size buffer of elements in a circular manner. The circular nature of the queue ensures that the oldest elements are replaced by new elements, making it well-suited for various real-time and continuous data processing tasks.
    





  
Implementing Circular Queue using Linked List:
Yes, a circular queue can be implemented using a linked list. Instead of using a fixed-size array as the underlying data structure, we can use a linked list to create a circular chain of nodes.

To implement a circular queue with a linked list, we need to ensure that the "rear" node's "next" pointer points back to the "front" node. Here's a basic implementation of a Circular Queue using a linked list:





class CircularQueue {
    constructor() {
        this.linkedList = new LinkedList();
    }

    enqueue(value) {
        this.linkedList.append(value);
        // Make the linked list circular by setting the next pointer of the new tail to the head
        this.linkedList.tail.next = this.linkedList.head;
    }

    dequeue() {
        if (!this.linkedList.isEmpty()) {
            let removedValue = this.linkedList.removeFrom(0);
            // If the list is not empty after dequeue, update the next pointer of the tail
            if (!this.linkedList.isEmpty()) {
                this.linkedList.tail.next = this.linkedList.head;
            }
            return removedValue;
        }
        return null;
    }

    isEmpty() {
        return this.linkedList.isEmpty();
    }

    getSize() {
        return this.linkedList.getSize();
    }

    print() {
        if (!this.linkedList.isEmpty()) {
            let curr = this.linkedList.head;
            let values = `${curr.value} `;
            while (curr.next !== this.linkedList.head) {
                curr = curr.next;
                values += `${curr.value} `;
            }
            console.log(values);
        } else {
            console.log("This Queue is Empty");
        }
    }
}



      In the enqueue method, we make the linked list circular by setting the next pointer of the new tail to the head of the list. In the dequeue method, we first check if the list is not empty. If it's not, we remove the head element from the list and then check again if the list is still not empty. If it's not, we update the next pointer of the tail to the new head of the list. The print method has been updated to stop printing when it reaches the head again, to avoid an infinite loop stackoverflow.com, dev.to.



THE LIKED LIST USED IN THIS APPLICATION IS HERE BELOW
***********************************************************************************************************************************************
        class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.size = 0;
    }

    isEmpty() {
        return this.size === 0;
    }

    getSize() {
        return this.size;
    }

    prepend(value) {
        const node = new Node(value);
        if (this.isEmpty()) {
            this.head = node;
            this.tail = node;
        } else {
            node.next = this.head;
            this.head = node;
        }
        this.size++;
    }

    append(value) {
        const node = new Node(value);
        if (this.isEmpty()) {
            this.head = node;
            this.tail = node;
        } else {
            this.tail.next = node;
            this.tail = node;
        }
        this.size++;
    }

    removeFrom(index) {
        if (index < 0 || index >= this.size) {
            return console.log("Index is out of bounds");
        }

        let removedNode;
        if (index === 0) {
            removedNode = this.head;
            this.head = this.head.next;
            if (this.size === 1) {
                this.tail = null;
            }
        } else {
            let prev = this.head;
            for (let i = 0; i < index - 1; i++) {
                prev = prev.next;
            }
            removedNode = prev.next;
            prev.next = removedNode.next;
            if (index === this.size - 1) {
                this.tail = prev;
            }
        }

        this.size--;
        return removedNode.value;
    }

    print() {
        if (this.isEmpty()) {
            console.log("This List is Empty");
        } else {
            let curr = this.head;
            let listValues = "";
            while (curr) {
                listValues += `${curr.value} `;
                curr = curr.next;
            }
            console.log(listValues);
        }
    }
}

// Stack implementation using the above LinkedList
class Stack {
    constructor() {
        this.linkedList = new LinkedList();
    }

    push(value) {
        this.linkedList.prepend(value);
    }

    pop() {
        return this.linkedList.removeFrom(0);
    }

    isEmpty() {
        return this.linkedList.isEmpty();
    }

    getSize() {
        return this.linkedList.getSize();
    }

    print() {
        this.linkedList.print();
    }
}

// Queue implementation using the above LinkedList
class Queue {
    constructor() {
        this.linkedList = new LinkedList();
    }

    enqueue(value) {
        this.linkedList.append(value);
    }

    dequeue() {
        return this.linkedList.removeFrom(0);
    }

    isEmpty() {
        return this.linkedList.isEmpty();
    }

    getSize() {
        return this.linkedList.getSize();
    }

    print() {
        this.linkedList.print();
    }
}




USES AND APPLICATIONS OF CIRCULAR QUEUUEU
***********************************************************************************************************************************************


  Circular queues can be utilized in various scenarios to efficiently manage and cycle through data. Here are some examples:

1.Clock:
A circular queue can be used to implement a clock in computer systems. The circular queue can store the twelve hours of a clock (1 to 12) and efficiently handle the movement of time in a circular manner.
javascript
Copy code
class Clock {
  constructor() {
    this.hoursQueue = new CircularQueue();
    for (let i = 1; i <= 12; i++) {
      this.hoursQueue.enqueue(i);
    }
  }

  moveOneHour() {
    this.hoursQueue.enqueue(this.hoursQueue.dequeue());
  }

  getCurrentHour() {
    return this.hoursQueue.front.value;
  }
}

// Example usage
const clock = new Clock();
console.log(clock.getCurrentHour()); // Output: 1
clock.moveOneHour();
console.log(clock.getCurrentHour()); // Output: 2



  
2.Traffic Lights:
In traffic light control systems, a circular queue can be used to control the sequence of traffic light signals (e.g., Red, Yellow, Green) in a circular manner.
javascript
Copy code
class TrafficLights {
  constructor() {
    this.signals = new CircularQueue();
    this.signals.enqueue("Red");
    this.signals.enqueue("Yellow");
    this.signals.enqueue("Green");
  }

  changeSignal() {
    this.signals.enqueue(this.signals.dequeue());
  }

  getCurrentSignal() {
    return this.signals.front.value;
  }
}

// Example usage
const trafficLights = new TrafficLights();
console.log(trafficLights.getCurrentSignal()); // Output: Red
trafficLights.changeSignal();
console.log(trafficLights.getCurrentSignal()); // Output: Yellow




  
3.Streaming Data:
Circular queues are commonly used in streaming scenarios where data is continuously received and processed in a cyclic manner. For example, in audio or video streaming applications, data packets can be enqueued and dequeued in a circular queue to manage the streaming flow.
javascript
Copy code
// Assume we have a stream of data packets arriving
const streamDataQueue = new CircularQueue();

// Function to process incoming data packets
function processDataPacket(packet) {
  streamDataQueue.enqueue(packet);
  // Process the data packet (e.g., play audio, display video)
  // Dequeue the data packet after processing to keep the circular flow
  streamDataQueue.dequeue();
}
In general, circular queues are useful in situations where there is a need to efficiently cycle through a fixed-size buffer of elements in a circular manner. They provide an optimized way to handle data flow without the overhead of resizing arrays or linked lists when elements are continuously enqueued and dequeued.





  USES AND APPLICATIONS OF CIRCULAR QUEUUEU
***********************************************************************************************************************************************
    Clock:

A circular queue can model a digital clock. Each number from 0 to 59 (representing seconds or minutes) or 0 to 23 (representing hours) can occupy a position in the queue. When the clock ticks, its like dequeuing the current number and enqueuing it at the end of the queue.

Here is a simplified example in JavaScript:

class Clock {
    constructor(maxValue) {
        this.queue = new CircularQueue();
        this.maxValue = maxValue;
        for (let i = 0; i < maxValue; i++) {
            this.queue.enqueue(i);
        }
    }

    tick() {
        let value = this.queue.dequeue();
        this.queue.enqueue(value);
        return value;
    }
}

let secondsClock = new Clock(60);
setInterval(() => console.log(secondsClock.tick()), 1000);
In this example, we create a Clock class that uses a CircularQueue to keep track of the seconds. Every second (1000 milliseconds), the clock "ticks", which means it dequeues the current second and enqueues it at the end of the queue geeksforgeeks.org, history-computer.com.

Traffic Lights:

In traffic light systems, circular queues can be used to switch the lights one by one repeatedly based on a set time. Each state of the traffic light (red, green, yellow) can be represented as an element in the queue.

Here is a simplified example in JavaScript:

class TrafficLight {
    constructor() {
        this.queue = new CircularQueue();
        this.queue.enqueue("RED");
        this.queue.enqueue("GREEN");
        this.queue.enqueue("YELLOW");
    }

    change() {
        let color = this.queue.dequeue();
        this.queue.enqueue(color);
        return color;
    }
}

let trafficLight = new TrafficLight();
setInterval(() => console.log(trafficLight.change()), 1000);
In this example, we create a TrafficLight class that uses a CircularQueue to keep track of the current color of the traffic light. Every second, the traffic light "changes", which means it dequeues the current color and enqueues it at the end of the queue geeksforgeeks.org, sparkcodehub.com.

Streaming Data:

For streaming data, a circular queue can be used as a buffer to temporarily store incoming data before it is processed. This is especially useful when data is being produced at a faster rate than it can be processed.

Here is a conceptual example in JavaScript:

class DataStream {
    constructor(bufferSize) {
        this.queue = new CircularQueue();
        this.bufferSize = bufferSize;
    }

    receive(data) {
        if (this.queue.getSize() < this.bufferSize) {
            this.queue.enqueue(data);
        } else {
            console.log("Buffer is full, dropping data");
        }
    }

    process() {
        if (!this.queue.isEmpty()) {
            let data = this.queue.dequeue();
            console.log("Processing data: " + data);
        } else {
            console.log("No data to process");
        }
    }
}

let dataStream = new DataStream(10);
setInterval(() => dataStream.receive(Math.random()), 500);
setInterval(() => dataStream.process(), 1000);
In this example, we create a DataStream class that uses a CircularQueue as a buffer for incoming data. The receive method adds new data to the buffer if there is space, and the process method removes data from the buffer for processing. If data is being produced faster than it can be processed, the buffer will eventually fill up, and new data will be dropped until there is space in the buffer again sparkcodehub.com.

