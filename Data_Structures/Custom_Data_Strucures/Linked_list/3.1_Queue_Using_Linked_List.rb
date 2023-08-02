To implement a queue using the linked list (LinkedListWithTail class provided), we can use the append(value) method to enqueue (add) elements to the end of the queue and the deleteFirst() method to dequeue (remove) elements from the front of the queue.


Queue:

A queue is a first-in-first-out (FIFO) data structure.
You can implement a queue using a singly linked list or a circular linked list.
The circular linked list is more efficient for queue operations because it allows O(1) insertion at the end (enqueue) and O(1) removal from the front (dequeue).

Here We Use Singly Linked List in the next file or explanantio we use circular queuue.


  
Lets create a queue class using the linked list:

class Queue {
  constructor() {
    this.linkedList = new LinkedListWithTail();
  }

  // Enqueue an element into the queue (equivalent to append in the linked list)
  enqueue(value) {
    this.linkedList.append(value);
  }

  // Dequeue an element from the queue (equivalent to deleteFirst in the linked list)
  dequeue() {
    if (this.isEmpty()) {
      console.log("Queue is empty. Cannot dequeue.");
      return;
    }
    const dequeuedValue = this.linkedList.deleteFirst();
    return dequeuedValue;
  }

  // Check if the queue is empty
  isEmpty() {
    return this.linkedList.isEmpty();
  }

  // Get the size of the queue
  getSize() {
    return this.linkedList.getSize();
  }

  // Print the elements of the queue
  print() {
    this.linkedList.print();
  }
}

// Example usage of the queue
const queue = new Queue();
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);

console.log("Queue size:", queue.getSize()); // Output: 3
queue.print(); // Output: 10 20 30

console.log("Dequeued element:", queue.dequeue()); // Output: Dequeued element: 10
console.log("Queue size:", queue.getSize()); // Output: 2
queue.print(); // Output: 20 30
Advantages of using a linked list for implementing a queue:

Dynamic Size: A linked list allows the queue to grow and shrink as needed, making it more flexible than a fixed-size array-based implementation.
Easy to Implement: The linked list provides a straightforward way to implement a queue, especially with the append() and deleteFirst() operations.
Efficient Enqueue and Dequeue: Both enqueue and dequeue operations in the linked list have constant time complexity O(1), which is efficient.
Additional Information:

Queues are widely used in programming and algorithms, e.g., in breadth-first search (BFS), task scheduling, and solving problems with first-in-first-out (FIFO) requirements.
The linked list-based queue is a popular choice due to its simplicity, but depending on the use case and language, other data structures like dynamic arrays or circular buffers might be preferred for better memory locality and cache performance.
When implementing a queue using a linked list, its essential to be aware of potential memory overhead associated with the pointers in the linked list nodes.











THIS IS THE LINKED LIST i USED
---------------------------------------------------------------------------------------------------------------------------------------

  This is the Linked List I Used or the one below this, I dont know which is which

  javascript
Copy code
class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedListWithTail {
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

    insert(value, index) {
        if (index < 0 || index > this.size) {
            return console.log("Index is out of bound");
        } else if (index === 0) {
            this.prepend(value);
        } else if (index === this.size) {
            this.append(value);
        } else {
            const node = new Node(value);
            let prev = this.head;
            for (let i = 0; i < index - 1; i++) {
                prev = prev.next;
            }
            node.next = prev.next;
            prev.next = node;
            this.size++;
        }
    }


    deleteFirst() {
        if (this.isEmpty()) {
            return console.log("List is empty, nothing to delete.");
        }

        if (this.head === this.tail) {
            this.head = null;
            this.tail = null;
        } else {
            this.head = this.head.next;
        }

        this.size--;
    }




            
    deleteLast() {
        if (this.isEmpty()) {
            return console.log("List is empty, nothing to delete.");
        }

        if (this.head === this.tail) {
            this.head = null;
            this.tail = null;
        } else {
            let prev = this.head;
            while (prev.next !== this.tail) {
                prev = prev.next;
            }
            prev.next = null;
            this.tail = prev;
        }

        this.size--;
    }


    removeFrom(index) {
        let removedNode;
        if (index < 0 || index >= this.size) {
            return console.log("Index is out of bound");
        } else if (index === 0) {
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












or this one , I dont know which is which
----------v-----v-----v-----v---------------------------------------------------------------------------------------------------------

  This is the Linked List I Used





class Node{

    constructor(value){
        this.value = value
        this.next = null

    }

}



class LinkedList{

    constructor(){
        this.head = null
        this.size=0
    }

    isEmpty(){
        return this.size === 0
    }

    getSize(){
        return this.size
    }

    // O(1) - Constant time complexity
    prepend(value){
        const node = new Node(value)

        if(this.isEmpty()){
            this.head =node

        } else{
            node.next = this.head
            this.head = node
        }
        this.size++ 

    }

    // O(n) - Linear time complexity
    append(value){
        const node = new Node(value)

        if(this.isEmpty()){
            this.head = node
        } else{
            let prev = this.head

            while(prev.next){
                prev = prev.next

            }
            prev.next = node
        }
        this.size++

    }

    insert(value,index){
        if(index < 0){
            return console.log("Index is less than zero")
        }else if(index > this.size){
            return console.log("Index is out of bound")


        }else if(index ===0){
            const node = new Node(value);
            node.next = this.head;
            this.head = node;

        }
        
        else{
            const node = new Node(value)
            let prev = this.head


            for(let i = 0; i< index-1;i++){
                prev = prev.next
            }

            node.next = prev.next
            prev.next = node

          

        }
        this.size++




    }
    removeFrom(index){
        let removedNode;
        if(index < 0){
            return console.log("Index is less than zero")
        }else if(index > this.size){
            return console.log("Index is out of bound")
        }else if(index ===0){
            removedNode = this.head
            this.head = this.head.next

          
        }        
        else{
           
            let prev = this.head


            for(let i = 0; i< index-1;i++){
                prev = prev.next
            }

           removedNode= prev.next
           prev.next = removedNode.next
          
         

          

        }
      

        this.size--
        return removedNode.value


   
   
    }

    search(value){
        if(this.isEmpty()){
            return console.log("This list is empty")
        }

        let i =0
        let cur = this.head

        while(cur){
            if(cur.value === value){
                return console.log(`The index is ${i}`)
            }
            cur = cur.next
            i++
        }

        return console.log("The value could not be found")

    }

    //O(n)
    removeValue(value){
        let removed ;

        if(this.isEmpty()){
            return console.log("There is no value here")
        }
        else if(this.head.value === value){
            removed= this.head
            this.head = removed.next
            this.size--
            return value

        }
        else{
            let prev = this.head;

            while(prev.next && prev.next.value !== value){
                prev = prev.next
            }
            if(prev.next){
                removed= prev.next
                prev.next = removed.next
                this.size--
                return value


            }

            return console.log("Value not found")
    

        }
        

    }
    reverse(){
        let prev = null
        let curr = this.head
        let next;

        while(curr){
            next = curr.next
            curr.next = prev
            prev = curr
            curr = next
        }

        this.head = prev


    }

    print(){
        if(this.isEmpty()){
            console.log("This List is Empty")
        } else{
            let curr = this.head
            let listValues = ''

            while(curr){
                listValues += `${curr.value} `
                curr = curr.next
            }

            console.log(listValues)
        }
    }
}

const list = new LinkedList()


