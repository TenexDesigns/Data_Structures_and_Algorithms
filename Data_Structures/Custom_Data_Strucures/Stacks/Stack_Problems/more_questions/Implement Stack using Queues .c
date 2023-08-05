Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).



****************************************************************************************************************

You can implement a last-in-first-out (LIFO) stack using two queues by simulating the behavior of a stack while maintaining the order of elements. The idea is to always keep one of the two queues empty while performing push and pop operations. This ensures that the most recently added element is always at the front of the non-empty queue, mimicking the behavior of a stack.

Heres how you can implement the LIFO stack using two queues in JavaScript:

```javascript
class MyStack {
    constructor() {
        this.queue1 = [];
        this.queue2 = [];
    }

    push(x) {
        // Push the new element to the non-empty queue
        this.queue1.push(x);
    }

    pop() {
        // Move all elements except the last one from queue1 to queue2
        while (this.queue1.length > 1) {
            this.queue2.push(this.queue1.shift());
        }
        
        // Remove and return the last element from queue1
        const popped = this.queue1.shift();
        
        // Swap the names of queue1 and queue2
        [this.queue1, this.queue2] = [this.queue2, this.queue1];
        
        return popped;
    }

    top() {
        // Move all elements except the last one from queue1 to queue2
        while (this.queue1.length > 1) {
            this.queue2.push(this.queue1.shift());
        }
        
        // Get the last element from queue1
        const topElement = this.queue1[0];
        
        // Move the last element to queue2 and swap queue names
        this.queue2.push(this.queue1.shift());
        [this.queue1, this.queue2] = [this.queue2, this.queue1];
        
        return topElement;
    }

    empty() {
        return this.queue1.length === 0;
    }
}

// Test the implementation
const stack = new MyStack();
stack.push(1);
stack.push(2);
console.log(stack.top());   // Output: 2
console.log(stack.pop());   // Output: 2
console.log(stack.empty()); // Output: false
```

**Explanation:**

1. In the `MyStack` class, you create two queues `queue1` and `queue2` to simulate the stack's behavior.

2. The `push(x)` function adds a new element `x` to the non-empty queue (in this case, `queue1`).

3. The `pop()` function simulates the pop operation by moving all elements except the last one from `queue1` to `queue2`. Then, it removes and returns the last element from `queue1`. Finally, it swaps the names of `queue1` and `queue2` so that `queue2` becomes empty.

4. The `top()` function simulates the top operation by moving all elements except the last one from `queue1` to `queue2`, getting the last element from `queue1`, moving it to `queue2`, and then swapping the names of the queues. This ensures that the top element remains at the front of the non-empty queue.

5. The `empty()` function checks if `queue1` is empty, which determines if the stack is empty.

This approach maintains the order of elements while ensuring that the most recently added element is always at the front of the non-empty queue. The time complexity of each operation is O(n), where n is the number of elements in the stack, since we have to move elements between the queues. However, in practice, this approach can still be efficient for small to moderate-sized stacks.



ANOTHER APPROCACH
********************************************************************************************************


To implement a stack using two queues in JavaScript, we can follow the approach of making the push operation costly. Here's the code implementation:

```javascript
class Stack {
  constructor() {
    this.q1 = []; // first queue
    this.q2 = []; // second queue
  }

  push(x) {
    // Enqueue the new element to q2
    this.q2.push(x);
    
    // Move all elements from q1 to q2
    while (this.q1.length > 0) {
      this.q2.push(this.q1.shift());
    }
    
    // Swap the names of q1 and q2
    [this.q1, this.q2] = [this.q2, this.q1];
  }

  pop() {
    if (this.q1.length === 0) {
      return;
    }

    // Dequeue an item from q1
    this.q1.shift();
  }

  top() {
    if (this.q1.length === 0) {
      return -1; // Stack is empty
    }
    
    return this.q1[0];
  }

  size() {
    return this.q1.length;
  }

  isEmpty() {
    return this.q1.length === 0;
  }
}

// Example usage:
let stack = new Stack();
stack.push(1);
stack.push(2);
stack.push(3);
console.log(stack.top()); // Output: 3
stack.pop();
console.log(stack.top()); // Output: 2
console.log(stack.size()); // Output: 2
console.log(stack.isEmpty()); // Output: false
```

In this implementation, we maintain two queues, `q1` and `q2`. The `push` operation is made costly by enqueueing the new element to `q2`, then moving all elements from `q1` to `q2`, and finally swapping the names of `q1` and `q2`. This ensures that the new element is always at the front of `q1`, making it accessible as the top of the stack. The `pop` operation simply dequeues the front element from `q1`. The `top` operation retrieves the front element of `q1`, and the `size` and `isEmpty` operations are implemented using the length of `q1`.

Sources:
- [GeeksforGeeks - Implement Stack using Queues](https://www.geeksforgeeks.org/implement-stack-using-queue/)
- [Stack Overflow - Implement a Stack using Two Queues](https://stackoverflow.com/questions/69192/how-to-implement-a-stack-using-two-queues)


