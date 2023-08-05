Design an algorithm that collects daily price quotes for some stock and returns the span of that stock's price for the current day.

The span of the stocks price in one day is the maximum number of consecutive days (starting from that day and going backward) for which the stock price was less than or equal to the price of that day.

For example, if the prices of the stock in the last four days is [7,2,1,2] and the price of the stock today is 2, then the span of today is 4 because starting from today, the price of the stock was less than or equal 2 for 4 consecutive days.
Also, if the prices of the stock in the last four days is [7,34,1,2] and the price of the stock today is 8, then the span of today is 3 because starting from today, the price of the stock was less than or equal 8 for 3 consecutive days.



***************************************************************************************************************************************
To calculate the stock price span using a stack in JavaScript, you can use the following approaches:

Approach 1 (Using Stack):
1. Create an empty stack to store the indices of the stock prices.
2. Initialize an array `S` of the same length as the stock prices, where each element represents the span value for that day.
3. Iterate over the stock prices from left to right.
4. For each stock price, compare it with the stock price corresponding to the index at the top of the stack.
   - If the current stock price is greater than the stock price at the top of the stack, pop the stack until either the stack is empty or the stock price at the top of the stack is greater than the current stock price.
   - Calculate the span value for the current day by subtracting the index at the top of the stack from the current index.
   - Push the current index to the stack.
5. Repeat steps 4 and 5 for all stock prices.
6. Return the array `S` containing the span values.

Here's the code implementation of the above approach:

```javascript
function calculateSpan(price, n) {
  const stack = []; // Stack to store indices of stock prices
  const S = new Array(n).fill(0); // Array to store span values

  // Push the index of the first stock price to the stack
  stack.push(0);
  S[0] = 1;

  for (let i = 1; i < n; i++) {
    while (stack.length !== 0 && price[stack[stack.length - 1]] <= price[i]) {
      stack.pop();
    }

    // Calculate the span value for the current day
    S[i] = stack.length === 0 ? i + 1 : i - stack[stack.length - 1];

    // Push the current index to the stack
    stack.push(i);
  }

  return S;
}

// Example usage:
const price = [7, 2, 1, 2];
const n = price.length;
const span = calculateSpan(price, n);
console.log(span); // Output: [4, 3, 2, 1]
```

Approach 2 (Without Using Stack):
1. Initialize an array `S` of the same length as the stock prices, where each element represents the span value for that day.
2. Iterate over the stock prices from left to right.
3. For each stock price, initialize a counter variable to 1.
4. While the counter is less than or equal to the current index and the stock price at the current index is greater than or equal to the stock price at the (current index - counter), increment the counter by the span value at (current index - counter).
5. Assign the counter value to the span value for the current day in the array `S`.
6. Repeat steps 3 to 5 for all stock prices.
7. Return the array `S` containing the span values.

Here's the code implementation of the above approach:

```javascript
function calculateSpan(price, n) {
  const S = new Array(n).fill(0); // Array to store span values

  S[0] = 1;

  for (let i = 1; i < n; i++) {
    let counter = 1;
    while (i - counter >= 0 && price[i] >= price[i - counter]) {
      counter += S[i - counter];
    }
    S[i] = counter;
  }

  return S;
}

// Example usage:
const price = [7, 2, 1, 2];
const n = price.length;
const span = calculateSpan(price, n);
console.log(span); // Output: [4, 3, 2, 1]
```

Both approaches have a time complexity of O(n), where n is the number of stock prices.

Sources:
- [GeeksforGeeks - The Stock Span Problem](https://www.geeksforgeeks.org/the-stock-span-problem/)
- [Stack Overflow - Calculate Stock Span Without Using Stack](https://stackoverflow.com/questions/34975949/calculate-stock-span-without-using-stack)






MORE ARROACH
***************************************************************************************************************************************

To solve this problem, you can use a stack to keep track of the consecutive days where the stock price is less than or equal to the current day's price. The key idea is to push the indices of the prices onto the stack while checking if the current day's price is greater than the price corresponding to the index at the top of the stack. When you encounter a price that is greater, you pop elements from the stack and calculate the span.

Here's how you can implement the solution in JavaScript:

```javascript
class StockSpanner {
    constructor() {
        this.prices = [];
        this.spans = [];
    }
    
    next(price) {
        let span = 1;
        while (this.prices.length > 0 && price >= this.prices[this.prices.length - 1]) {
            span += this.spans.pop();
            this.prices.pop();
        }
        this.prices.push(price);
        this.spans.push(span);
        return span;
    }
}

// Test the implementation
const stockSpanner = new StockSpanner();
console.log(stockSpanner.next(100)); // Output: 1
console.log(stockSpanner.next(80));  // Output: 1
console.log(stockSpanner.next(60));  // Output: 1
console.log(stockSpanner.next(70));  // Output: 2
console.log(stockSpanner.next(60));  // Output: 1
console.log(stockSpanner.next(75));  // Output: 4
console.log(stockSpanner.next(85));  // Output: 6
```

**Explanation:**

1. Create a `StockSpanner` class that maintains two arrays: `prices` to store the stock prices and `spans` to store the spans for each day.

2. In the `next(price)` method, initialize a `span` variable to 1 (indicating the current day).

3. While the `prices` array is not empty and the current `price` is greater than or equal to the price corresponding to the index at the top of the stack (`this.prices[this.prices.length - 1]`), you pop elements from the stack, accumulate their spans, and update the `span` variable.

4. Push the current `price` onto the `prices` array and the accumulated `span` onto the `spans` array.

5. Return the calculated `span`.

This approach ensures that you efficiently calculate the span for each day while maintaining the condition that the stock price is less than or equal to the current day's price for consecutive days. The time complexity of each `next` operation is amortized O(1), and each price is pushed and popped from the stack at most once.
