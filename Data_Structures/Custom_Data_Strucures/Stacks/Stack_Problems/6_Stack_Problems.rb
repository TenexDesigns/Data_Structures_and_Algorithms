
Certainly! Here are a few more problems and tasks solved using stacks and algorithms with code samples:

Valid Parentheses:
Problem: Given a string containing only parentheses '(', ')', '{', '}', '[', and ']', determine if the input string is valid.
Algorithm: Use a stack to keep track of opening parentheses. When encountering a closing parenthesis, check if it matches the top of the stack. If yes, pop the opening parenthesis from the stack; otherwise, the string is invalid.
Code Sample:
javascript
Copy code
function isValidParentheses(s) {
  const stack = [];

  for (let char of s) {
    if (char === '(' || char === '{' || char === '[') {
      stack.push(char);
    } else {
      const top = stack.pop();
      if (
        (char === ')' && top !== '(') ||
        (char === '}' && top !== '{') ||
        (char === ']' && top !== '[')
      ) {
        return false;
      }
    }
  }

  return stack.length === 0;
}

console.log(isValidParentheses('()')); // Output: true
console.log(isValidParentheses('()[]{}')); // Output: true
console.log(isValidParentheses('(]')); // Output: false
console.log(isValidParentheses('([)]')); // Output: false
Reverse Stack:
Problem: Reverse the order of elements in a given stack using only one extra stack and no other data structure.
Algorithm: Use two stacks, one to store the elements in the original order and the other to reverse the order. Pop elements from the first stack and push them into the second stack to achieve the reversed order.
Code Sample:
javascript
Copy code
function reverseStack(stack) {
  const reversedStack = [];
  while (stack.length > 0) {
    reversedStack.push(stack.pop());
  }
  return reversedStack;
}

const stack = [1, 2, 3, 4, 5];
const reversedStack = reverseStack(stack);
console.log(reversedStack); // Output: [5, 4, 3, 2, 1]
Minimum Stack:
Problem: Implement a stack that supports push, pop, and getMin operations, all with O(1) time complexity.
Algorithm: Use two stacks, one for the main elements and another to keep track of the minimum element at each stage.
Code Sample:
javascript
Copy code
class MinStack {
  constructor() {
    this.stack = [];
    this.minStack = [];
  }

  push(val) {
    this.stack.push(val);
    if (
      this.minStack.length === 0 ||
      val <= this.minStack[this.minStack.length - 1]
    ) {
      this.minStack.push(val);
    }
  }

  pop() {
    const popped = this.stack.pop();
    if (popped === this.minStack[this.minStack.length - 1]) {
      this.minStack.pop();
    }
    return popped;
  }

  getMin() {
    return this.minStack[this.minStack.length - 1];
  }
}

const minStack = new MinStack();
minStack.push(3);
minStack.push(1);
minStack.push(5);
console.log(minStack.getMin()); // Output: 1
minStack.pop();
console.log(minStack.getMin()); // Output: 1
These are some additional problems and tasks solved using stacks and algorithms. Stacks are versatile data structures with various applications in solving real-world problems and algorithmic challenges. They are fundamental in parsing expressions, maintaining state, and solving problems that involve last-in-first-out (LIFO) operations.




