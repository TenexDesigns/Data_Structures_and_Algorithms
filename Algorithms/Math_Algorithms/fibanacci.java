Certainly! The Fibonacci sequence is a series of numbers in which each number is the sum of the two preceding ones, usually starting with 0 and 1. Here's an example of how you can implement the Fibonacci sequence in TypeScript using both recursive and iterative approaches:

### Recursive Approach:

```typescript
function fibonacciRecursive(n: number): number {
    if (n <= 1) {
        return n;
    }
    return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2);
}

// Example usage:
const recursiveResult = fibonacciRecursive(6);
console.log("Fibonacci (Recursive):", recursiveResult);
```

### Iterative Approach:

```typescript
function fibonacciIterative(n: number): number {
    if (n <= 1) {
        return n;
    }

    let fib = [0, 1];
    for (let i = 2; i <= n; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }

    return fib[n];
}

// Example usage:
const iterativeResult = fibonacciIterative(6);
console.log("Fibonacci (Iterative):", iterativeResult);
```

These examples demonstrate both a recursive and an iterative way to calculate the Fibonacci sequence. The recursive approach can become inefficient for large values of `n` due to repeated calculations. The iterative approach, using dynamic programming, is generally more efficient and is recommended for larger values of `n`.



  
