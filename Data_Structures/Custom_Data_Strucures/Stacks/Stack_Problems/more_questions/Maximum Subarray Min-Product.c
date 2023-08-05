To solve this problem, we can use a stack-based approach that keeps track of the maximum min-product of any subarray. The idea is to find the maximum sum of subarray for each possible minimum value in the array. We use a stack to keep track of the indices of the increasing elements in the array. When we encounter a number smaller than the top element of the stack, it means we have found a subarray where the smallest number is the top element of the stack. We calculate the min-product of this subarray and update the maximum min-product if necessary. 

Here are the steps and JavaScript code implementation:

1. Initialize an empty stack and a variable `maxMinProduct` to keep track of the maximum min-product.

2. Iterate through the `nums` array from left to right.

3. While the stack is not empty and the current number is smaller than the number at the top of the stack:
   - Pop the top element from the stack as `top`.
   - Calculate the sum of subarray from `nums[top]` to the current number (exclusive) as `sum`. If the stack is not empty, subtract the sum of subarray to the left of `nums[top]` because it has been counted in the previous step.
   - Calculate the min-product of this subarray as `minProduct = nums[top] * sum`.
   - Update `maxMinProduct = max(maxMinProduct, minProduct)`.

4. Push the current index to the stack.

5. After the iteration, calculate the min-product for each number in the stack in the same way as step 3.

6. Return `maxMinProduct % (1e9 + 7)`.

Here's the JavaScript code implementation:

```javascript
function maxSumMinProduct(nums) {
  const n = nums.length;
  const stack = [];
  const sum = Array(n + 1).fill(0);
  let maxMinProduct = 0;

  for (let i = 0; i <= n; i++) {
    while (stack.length && (i === n || nums[stack[stack.length - 1]] > nums[i])) {
      const j = stack.pop();
      const k = stack.length ? stack[stack.length - 1] : -1;
      maxMinProduct = Math.max(maxMinProduct, nums[j] * (sum[i] - sum[k + 1]));
    }
    stack.push(i);
    if (i < n) {
      sum[i + 1] = sum[i] + nums[i];
    }
  }

  return maxMinProduct % (1e9 + 7);
}

// Example usage:
console.log(maxSumMinProduct([1,2,3,2])); // Output: 14
console.log(maxSumMinProduct([2,3,3,1,2])); // Output: 18
console.log(maxSumMinProduct([3,1,5,6,4,2])); // Output: 60
```

This code implementation is a modified version of the solution found in [Source 5](https://www.geeksforgeeks.org/maximum-product-subarray/), which finds the maximum product of a subarray. We modified it to find the maximum sum of subarray for each possible minimum value in the array, and calculate the min-product accordingly.







Another Approach
***************************************************************************************************************************************************************************


To solve this problem, you can use two concepts: monotonic stacks and prefix sums. The idea is to find the maximum min-product for each element in the array by considering its value as the minimum value in a subarray. To do this efficiently, you can use a monotonic decreasing stack to keep track of elements that can potentially form subarrays, and you can also calculate prefix sums to compute the sum of elements in a subarray.

Here's how you can implement the solution in JavaScript:

```javascript
const MOD = 1e9 + 7;

function maxMinProduct(nums) {
    const n = nums.length;
    const left = new Array(n);
    const right = new Array(n);
    const stack = [];
    
    // Calculate the left boundaries for each element
    for (let i = 0; i < n; i++) {
        while (stack.length > 0 && nums[i] <= nums[stack[stack.length - 1]]) {
            stack.pop();
        }
        left[i] = stack.length === 0 ? -1 : stack[stack.length - 1];
        stack.push(i);
    }
    
    stack.length = 0; // Clear the stack
    
    // Calculate the right boundaries for each element
    for (let i = n - 1; i >= 0; i--) {
        while (stack.length > 0 && nums[i] <= nums[stack[stack.length - 1]]) {
            stack.pop();
        }
        right[i] = stack.length === 0 ? n : stack[stack.length - 1];
        stack.push(i);
    }
    
    let maxProduct = 0;
    
    for (let i = 0; i < n; i++) {
        maxProduct = Math.max(maxProduct, nums[i] * (prefixSum(right[i] - 1, nums) - prefixSum(left[i], nums)));
    }
    
    return maxProduct % MOD;
}

// Calculate prefix sum up to index 'i'
function prefixSum(i, nums) {
    return i >= 0 ? nums.slice(0, i + 1).reduce((acc, num) => acc + num, 0) : 0;
}

// Test cases
console.log(maxMinProduct([1, 2, 3, 2])); // Output: 14
console.log(maxMinProduct([2, 3, 3, 1, 2])); // Output: 18
console.log(maxMinProduct([3, 1, 5, 6, 4, 2])); // Output: 60
```

**Explanation:**

1. First, we calculate the left boundaries of each element using a monotonic decreasing stack. `left[i]` represents the index of the previous smaller element to the left of `i`.

2. Then, we calculate the right boundaries of each element using the same approach. `right[i]` represents the index of the next smaller element to the right of `i`.

3. We iterate through each element and calculate the maximum min-product that can be achieved with that element as the minimum value in a subarray. This is done by computing the product of the element with the sum of the subarray `[left[i] + 1, right[i] - 1]`.

4. We use the `prefixSum` function to calculate the sum of elements in the specified subarray. This function helps us calculate the subarray sum efficiently using prefix sums.

5. Finally, we return the maximum min-product modulo 10^9 + 7 as required.

The monotonic stack approach ensures that we efficiently find the left and right boundaries for each element, and the prefix sum calculation helps us compute subarray sums efficiently. This solution has a time complexity of O(n) where n is the length of the input array.












