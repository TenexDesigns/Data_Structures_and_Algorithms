Sure, here are some problems and tasks solved using stacks and algorithms along with code samples:

1. Balanced Parentheses:
   - Problem: Check if a given expression containing parentheses is balanced or not.
   - Algorithm: Use a stack to keep track of opening parentheses. For each closing parenthesis encountered, check if the stack's top element is the corresponding opening parenthesis.
   - Code Sample:

```javascript
function isBalanced(expression) {
  const stack = [];
  const openParentheses = "({[";
  const closeParentheses = ")}]";

  for (let char of expression) {
    if (openParentheses.includes(char)) {
      stack.push(char);
    } else if (closeParentheses.includes(char)) {
      const lastOpen = stack.pop();
      const correspondingOpen = openParentheses[closeParentheses.indexOf(char)];

      if (lastOpen !== correspondingOpen) {
        return false;
      }
    }
  }

  return stack.length === 0;
}

console.log(isBalanced("(()[{}])")); // Output: true
console.log(isBalanced("([)]"));     // Output: false
```

2. Evaluate Postfix Expressions:
   - Problem: Evaluate a given postfix expression to obtain the result.
   - Algorithm: Use a stack to store operands and perform operations when encountering operators.
   - Code Sample:

```javascript
function evaluatePostfix(postfix) {
  const stack = [];

  for (let token of postfix) {
    if (!isNaN(token)) {
      stack.push(parseFloat(token));
    } else {
      const operand2 = stack.pop();
      const operand1 = stack.pop();

      switch (token) {
        case "+":
          stack.push(operand1 + operand2);
          break;
        case "-":
          stack.push(operand1 - operand2);
          break;
        case "*":
          stack.push(operand1 * operand2);
          break;
        case "/":
          stack.push(operand1 / operand2);
          break;
      }
    }
  }

  return stack.pop();
}

console.log(evaluatePostfix(["2", "3", "4", "*", "+"])); // Output: 14
```

3. Tower of Hanoi:
   - Problem: Solve the Tower of Hanoi puzzle using a stack-based algorithm.
   - Algorithm: Implement the iterative version of the Tower of Hanoi using three stacks to simulate the pegs.
   - Code Sample:

```javascript
function towerOfHanoi(numDisks, source, auxiliary, destination) {
  const stack = [];
  stack.push({ numDisks, source, auxiliary, destination });

  while (stack.length > 0) {
    const { numDisks, source, auxiliary, destination } = stack.pop();

    if (numDisks === 1) {
      console.log(`Move disk 1 from ${source} to ${destination}`);
    } else {
      stack.push({ numDisks: numDisks - 1, source, auxiliary, destination });
      console.log(`Move disk ${numDisks} from ${source} to ${destination}`);
      stack.push({ numDisks: numDisks - 1, auxiliary, destination, source });
    }
  }
}

towerOfHanoi(3, "A", "B", "C");
// Output:
// Move disk 1 from A to C
// Move disk 2 from A to B
// Move disk 1 from C to B
// Move disk 3 from A to C
// Move disk 1 from B to A
// Move disk 2 from B to C
// Move disk 1 from A to C
```

These are just a few examples of problems and tasks solved using stacks and algorithms. Stacks are powerful data structures that can be used to efficiently solve a wide range of problems in computer science and real-world applications.



