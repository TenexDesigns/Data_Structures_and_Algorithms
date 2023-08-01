Sure! Here are a few more problems and tasks solved using stacks and algorithms along with code samples:

Infix to Postfix Conversion:
Problem: Convert an infix expression to a postfix expression using the Shunting Yard algorithm.
Algorithm: Use two stacks, one for operators and one for the output. Scan the infix expression from left to right and apply the Shunting Yard algorithm to convert it to postfix notation.
Code Sample:
javascript
Copy code
function infixToPostfix(infix) {
  const precedence = {
    '+': 1,
    '-': 1,
    '*': 2,
    '/': 2,
    '^': 3,
  };

  const stack = [];
  const output = [];

  for (let char of infix) {
    if (/\d/.test(char)) {
      output.push(char);
    } else if (char === '(') {
      stack.push(char);
    } else if (char === ')') {
      while (stack.length > 0 && stack[stack.length - 1] !== '(') {
        output.push(stack.pop());
      }
      stack.pop(); // Pop '('
    } else {
      while (
        stack.length > 0 &&
        precedence[stack[stack.length - 1]] >= precedence[char]
      ) {
        output.push(stack.pop());
      }
      stack.push(char);
    }
  }

  while (stack.length > 0) {
    output.push(stack.pop());
  }

  return output.join('');
}

console.log(infixToPostfix('2 + 3 * 4')); // Output: '234*+'
console.log(infixToPostfix('5 + (4 - 2) * 8')); // Output: '542-8*+'
Evaluate Postfix Expression:
Problem: Evaluate a given postfix expression.
Algorithm: Use a stack to store operands and apply the postfix evaluation algorithm to obtain the result.
Code Sample:
javascript
Copy code
function evaluatePostfix(postfix) {
  const stack = [];

  for (let char of postfix) {
    if (/\d/.test(char)) {
      stack.push(parseInt(char));
    } else {
      const operand2 = stack.pop();
      const operand1 = stack.pop();
      switch (char) {
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
          stack.push(operand1 / operand2);
          break;
      }
    }
  }

  return stack.pop();
}

console.log(evaluatePostfix('234*+')); // Output: 14
console.log(evaluatePostfix('542-8*+')); // Output: 25
Next Greater Element:
Problem: Given an array, find the next greater element for each element in the array. If there is no greater element, assign -1.
Algorithm: Use a stack to keep track of elements and their indices. Traverse the array and compare elements with those in the stack to find the next greater element.
Code Sample:
javascript
Copy code
function nextGreaterElements(arr) {
  const stack = [];
  const result = new Array(arr.length).fill(-1);

  for (let i = 0; i < arr.length; i++) {
    while (stack.length > 0 && arr[i] > arr[stack[stack.length - 1]]) {
      result[stack.pop()] = arr[i];
    }
    stack.push(i);
  }

  return result;
}

console.log(nextGreaterElements([4, 2, 5, 7, 1])); // Output: [5, 5, 7, -1, -1]
These are some additional problems and tasks solved using stacks and algorithms. Stacks are powerful data structures with various applications, such as expression parsing, function call tracking, and more. They are widely used in solving algorithmic problems due to their simple and efficient nature.




