Certainly! Here's an example of how you can implement the factorial function in TypeScript using both recursive and iterative approaches:

### Recursive Approach:

```typescript
function factorialRecursive(n: number): number {
    if (n === 0 || n === 1) {
        return 1;
    }
    return n * factorialRecursive(n - 1);
}

// Example usage:
const recursiveResult = factorialRecursive(5);
console.log("Factorial (Recursive):", recursiveResult);
```

### Iterative Approach:

```typescript
function factorialIterative(n: number): number {
    let result = 1;

    for (let i = 2; i <= n; i++) {
        result *= i;
    }

    return result;
}

// Example usage:
const iterativeResult = factorialIterative(5);
console.log("Factorial (Iterative):", iterativeResult);
```

In the recursive approach, the function calls itself until it reaches the base case (`n === 0` or `n === 1`). In the iterative approach, a loop is used to calculate the factorial by multiplying numbers from 2 to `n`. Both approaches are valid, but the iterative approach is often more efficient for factorials.


















  
