Sure, here are some more problems and tasks solved using stacks and algorithms along with code samples:

4. Infix to Postfix Conversion:
   - Problem: Convert an infix expression to a postfix expression using the Shunting Yard algorithm.
   - Algorithm: Use two stacks, one for operators and one for the output. Iterate through the infix expression and apply the Shunting Yard rules to convert it to postfix.
   - Code Sample:

```javascript
function infixToPostfix(infix) {
  const stack = [];
  const output = [];
  const precedence = { "+": 1, "-": 1, "*": 2, "/": 2 };

  for (let token of infix) {
    if (!isNaN(token)) {
      output.push(token);
    } else if (token === "(") {
      stack.push(token);
    } else if (token === ")") {
      while (stack.length > 0 && stack[stack.length - 1] !== "(") {
        output.push(stack.pop());
      }
      stack.pop(); // Discard the "("
    } else {
      while (
        stack.length > 0 &&
        precedence[token] <= precedence[stack[stack.length - 1]]
      ) {
        output.push(stack.pop());
      }
      stack.push(token);
    }
  }

  while (stack.length > 0) {
    output.push(stack.pop());
  }

  return output;
}

console.log(infixToPostfix(["2", "+", "3", "*", "4"])); // Output: ["2", "3", "4", "*", "+"]
```

5. Validating Stack Sequences:
   - Problem: Given two integer arrays pushed and popped, check if it is possible to construct the original stack with the given sequences.
   - Algorithm: Use a stack to simulate the pushed and popped elements and check if they form a valid sequence.
   - Code Sample:

```javascript
function validateStackSequences(pushed, popped) {
  const stack = [];
  let j = 0;

  for (let num of pushed) {
    stack.push(num);

    while (stack.length > 0 && stack[stack.length - 1] === popped[j]) {
      stack.pop();
      j++;
    }
  }

  return stack.length === 0;
}

console.log(validateStackSequences([1, 2, 3, 4, 5], [4, 5, 3, 2, 1])); // Output: true
```

6. Next Greater Element:
   - Problem: Given an array, find the next greater element for each element in the array.
   - Algorithm: Use a stack to keep track of elements for which the next greater element is yet to be found.
   - Code Sample:

```javascript
function nextGreaterElement(nums) {
  const stack = [];
  const result = new Map();

  for (let num of nums) {
    while (stack.length > 0 && num > stack[stack.length - 1]) {
      result.set(stack.pop(), num);
    }
    stack.push(num);
  }

  while (stack.length > 0) {
    result.set(stack.pop(), -1);
  }

  return result;
}

console.log(nextGreaterElement([4, 2, 5, 8])); // Output: Map { 4 => 5, 2 => 5, 5 => 8, 8 => -1 }
```

These are some additional problems and tasks solved using stacks and algorithms. Stacks are versatile data structures that can be used to solve various computational problems efficiently.
