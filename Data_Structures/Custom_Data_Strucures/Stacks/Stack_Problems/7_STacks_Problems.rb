Certainly! Here are a few more problems and tasks solved using stacks and algorithms with code samples:

16. Evaluate Reverse Polish Notation:
   - Problem: Given an array of strings representing a valid Reverse Polish Notation (RPN) expression, evaluate the expression and return the result.
   - Algorithm: Use a stack to keep track of operands. When encountering an operator, pop the last two operands from the stack, perform the operation, and push the result back to the stack.
   - Code Sample:

```javascript
function evaluateRPN(tokens) {
  const stack = [];

  for (let token of tokens) {
    if (!isNaN(token)) {
      stack.push(parseInt(token));
    } else {
      const operand2 = stack.pop();
      const operand1 = stack.pop();
      switch (token) {
        case '+':
          stack.push(operand1 + operand2);
          break;
        case '-':
          stack.push(operand1 - operand2);
          break;
        case '*':
          stack.push(operand1 * operand2);
          break;
        case '/':
          stack.push(Math.trunc(operand1 / operand2));
          break;
      }
    }
  }

  return stack[0];
}

console.log(evaluateRPN(['2', '1', '+', '3', '*'])); // Output: 9 (2 + 1) * 3
console.log(evaluateRPN(['4', '13', '5', '/', '+'])); // Output: 6 (4 + (13 / 5))
```

17. Next Greater Element:
   - Problem: Given an array, find the next greater element for each element in the array. If there is no greater element, set it to -1.
   - Algorithm: Use a stack to keep track of elements in descending order. For each element, pop elements from the stack that are smaller than the current element and mark them as the next greater element. Push the current element onto the stack.
   - Code Sample:

```javascript
function nextGreaterElement(nums) {
  const result = new Array(nums.length).fill(-1);
  const stack = [];

  for (let i = 0; i < nums.length; i++) {
    while (stack.length > 0 && nums[i] > nums[stack[stack.length - 1]]) {
      const index = stack.pop();
      result[index] = nums[i];
    }
    stack.push(i);
  }

  return result;
}

console.log(nextGreaterElement([4, 5, 2, 25])); // Output: [5, 25, 25, -1]
console.log(nextGreaterElement([13, 7, 6, 12])); // Output: [-1, 12, 12, -1]
```

18. Min Stack with GetMin in O(1):
   - Problem: Implement a stack that supports push, pop, top, and getMin operations, all with O(1) time complexity.
   - Algorithm: Use a stack to store elements and another stack to keep track of the minimum element. When pushing an element, check if it is smaller than or equal to the top of the minimum stack. If yes, push it onto the minimum stack as well.
   - Code Sample:

```javascript
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

  top() {
    return this.stack[this.stack.length - 1];
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
```

These are some additional problems and tasks solved using stacks and algorithms. Stacks are versatile data structures with various applications in solving real-world problems and algorithmic challenges. They are fundamental in parsing expressions, maintaining state, and solving problems that involve last-in-first-out (LIFO) operations.
