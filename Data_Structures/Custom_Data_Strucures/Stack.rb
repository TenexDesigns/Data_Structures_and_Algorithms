Stack data strucutre

The stack data strucure is a sequential collection of elemts that follows the principle of Last In First Out
The last elemnt inserted into the stack is the first elemnt to be removed

A common analogy is a stack of plates. The last plate placed on top of the stack is also the first plate to be reoved from the stack

Stack is an abstarct data type. It is defined by its beaviour rather than being a mathematical model.
A  stack is simply a list and what makes it a stack is how it behaves


The satck supports two main operations

-Push - which add an elemnt to the collection
-pop - which reomves the most recently added elemnent from the collection



STACK IMPLEMENTATION

push(element) - add an element to the top of the stack
pop() - remove the top most element from the stack
peek() - Get the value of the top element without removing it.
isEmpty() - Check if the stack is empty
size() - Get the number of elements in the statck
print() - Visualize the elements in the stack




Stack usage

Browser history tracking, - the forward and backward buttons on the browser
Undo  operation when typing
Callstack in javasript runtime
Expressinon conversions




A stack is a data structure that follows the LIFO (Last In, First Out) principle. This means that the last element added to the stack is the first one to be removed. Stacks are used in various programming scenarios such as managing function calls, syntax parsing, implementing undo functionality in text editors, and conversion of expressions (infix to postfix, infix to prefix, postfix to infix, and prefix to infix) javascripttutorial.net, geeksforgeeks.org.

While JavaScript does not have a built-in Stack data structure, it can be easily implemented using arrays. Arrays provide methods like push() and pop() which can be used to add and remove elements from the stack respectively dev.to.

Here is an example of a Stack implementation in JavaScript that includes the methods push(), pop(), peek(), isEmpty(), size(), and print():

class Stack {
    constructor() {
        this.items = [];
    }
    
    // add element to the top of the stack
    push(element) {
        return this.items.push(element);
    }
    
    // remove the top most element from the stack
    pop() {
        if(this.items.length > 0) {
            return this.items.pop();
        }
    }
    
    // get the value of the top element without removing it
    peek() {
        return this.items[this.items.length - 1];
    }
    
    // check if the stack is empty
    isEmpty(){
       return this.items.length == 0;
    }
   
    // get the number of elements in the stack
    size(){
        return this.items.length;
    }
 
    // visualize the elements in the stack
    print(){
        console.log(this.items);
    }
}
You can use this Stack class as follows:

let stack = new Stack();
stack.push(1);
stack.push(2);
stack.push(3);
stack.print(); // [1, 2, 3]
console.log(stack.pop()); // 3
console.log(stack.peek()); // 2
console.log(stack.isEmpty()); // false
console.log(stack.size()); // 2
  
The reason to use a stack instead of an array directly is that a stack provides a specific set of operations (LIFO) that are not inherently enforced by arrays. Using a stack makes your code more readable and self-explanatory, because it signals that you are using the LIFO principle freecodecamp.org.













MORE EXPLANANTION
***************************************************************************************************************************************************


        A stack is a linear data structure that follows the Last In First Out (LIFO) principle. It means that the last element added to the stack will be the first one to be removed. Stacks are used in various computer algorithms and applications, such as function calls, expression evaluation, and undo/redo functionality.

In JavaScript, you can implement a stack using an array or by creating a custom Stack class. Below is an implementation of a stack in JavaScript with the specified methods:

javascript
Copy code
class Stack {
  constructor() {
    this.items = [];
  }

  push(element) {
    this.items.push(element);
  }

  pop() {
    if (this.isEmpty()) {
      return "Stack is empty";
    }
    return this.items.pop();
  }

  peek() {
    if (this.isEmpty()) {
      return "Stack is empty";
    }
    return this.items[this.items.length - 1];
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
const myStack = new Stack();
myStack.push(1);
myStack.push(2);
myStack.push(3);

myStack.print(); // Output: [1, 2, 3]
console.log(myStack.peek()); // Output: 3
console.log(myStack.pop()); // Output: 3
console.log(myStack.size()); // Output: 2
console.log(myStack.isEmpty()); // Output: false
      
In the example above, we created a custom Stack class with the required methods: push, pop, peek, isEmpty, size, and print. The push method adds an element to the top of the stack (end of the array), the pop method removes the top element, the peek method returns the value of the top element without removing it, the isEmpty method checks if the stack is empty, the size method returns the number of elements in the stack, and the print method visualizes the elements in the stack.

While arrays can be used to implement a stack, creating a custom Stack class provides more control and encapsulation over the stack operations. It also allows you to add additional functionality or validation specific to the stack, making the code cleaner and easier to maintain. Using a stack is beneficial when you need to perform operations in a Last In First Out (LIFO) manner and want to ensure that only specific methods are used for stack manipulation.




