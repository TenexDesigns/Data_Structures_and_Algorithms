4 Sum | Find Quads that add up to a target value
Problem Statement: Given an array of N integers, your task is to find unique quads that add up to give a target value. In short, you need to return an array of all the unique quadruplets [arr[a], arr[b], arr[c], arr[d]] such that their sum is equal to a given target.

Pre-req: 3-sum problem and 2-sum problem


---------------------------------------------





To solve the "4 Sum" problem, you can build upon the approach used to solve the "3 Sum" problem by extending it to handle four elements. The main idea is to fix two elements and then use a two-pointer approach to find the other two elements that sum up to the target.

Heres a step-by-step approach and reasoning behind it:

1. **Sort the Array:** Sort the input array in non-decreasing order. This will help in identifying duplicates and efficiently using the two-pointer approach.

2. **Loop Over the First Two Elements:** Use a loop to fix the first two elements of the quadruplet. These elements will be at indices `a` and `b` (0 <= a, b < n).

3. **Two-Pointer Approach for Remaining Elements:** For the remaining two elements, use a two-pointer approach. Initialize two pointers `c` and `d`, where `c` points to the element immediately after `b`, and `d` points to the last element in the array.

4. **Search for Sum:** Calculate the sum of the four elements: `arr[a] + arr[b] + arr[c] + arr[d]`. Compare the sum with the target value.

5. **Update Pointers:** Based on the sum, adjust the pointers:
   - If the sum is equal to the target, add the quadruplet `[arr[a], arr[b], arr[c], arr[d]]` to the result.
   - If the sum is less than the target, increment `c` to consider a larger value.
   - If the sum is greater than the target, decrement `d` to consider a smaller value.
   
6. **Skip Duplicates:** Inside the loop, skip duplicates by checking the neighboring elements. For example, if `c > a + 1` and `arr[c]` is the same as `arr[c - 1]`, increment `c` to skip duplicates. Similarly, if `d < n - 1` and `arr[d]` is the same as `arr[d + 1]`, decrement `d` to skip duplicates.

7. **Repeat for All Possible `a` and `b`:** Loop over all possible values of `a` and `b` to consider all pairs of first two elements.

8. **Return the Result:** After looping through all possible combinations, return the result array containing unique quadruplets that sum up to the target.

The reasoning behind this approach is that you're effectively reducing the problem of finding a 4 Sum to finding a 2 Sum (or 3 Sum) within a subarray. By fixing the first two elements and using a two-pointer approach for the remaining elements, you're systematically exploring all possible combinations of quadruplets and efficiently finding those that sum up to the target.

Here are examples illustrating how the solution works:

**Example 1:**
Input: `arr = [1, 0, -1, 0, -2, 2]`, `target = 0`
Output: `[[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]`

**Example 2:**
Input: `arr = [2, 2, 2, 2, 2]`, `target = 8`
Output: `[[2, 2, 2, 2]]`

**Example 3:**
Input: `arr = [-2, -1, -1, 1, 1, 2, 2]`, `target = 0`
Output: `[[-2, -1, 1, 2], [-1, -1, 1, 1]]`

By following the outlined approach and considering all possible combinations of elements, you can efficiently find unique quadruplets that add up to the target value.


Certainly! Here's the implementation of the solution to the "4 Sum" problem in JavaScript:

```javascript
function fourSum(nums, target) {
    const result = [];
    nums.sort((a, b) => a - b); // Sort the array in non-decreasing order

    for (let a = 0; a < nums.length - 3; a++) {
        if (a > 0 && nums[a] === nums[a - 1]) {
            continue; // Skip duplicates
        }

        for (let b = a + 1; b < nums.length - 2; b++) {
            if (b > a + 1 && nums[b] === nums[b - 1]) {
                continue; // Skip duplicates
            }

            let c = b + 1;
            let d = nums.length - 1;

            while (c < d) {
                const sum = nums[a] + nums[b] + nums[c] + nums[d];

                if (sum === target) {
                    result.push([nums[a], nums[b], nums[c], nums[d]]);
                    while (nums[c] === nums[c + 1]) c++; // Skip duplicates
                    while (nums[d] === nums[d - 1]) d--; // Skip duplicates
                    c++;
                    d--;
                } else if (sum < target) {
                    c++;
                } else {
                    d--;
                }
            }
        }
    }

    return result;
}
```

This solution follows the outlined approach and reasoning:

1. Sort the array to help with identifying duplicates and using the two-pointer approach.

2. Loop over the first two elements using nested loops `a` and `b`.

3. Use a two-pointer approach for the remaining two elements, with pointers `c` and `d`.

4. Calculate the sum of the four elements (`nums[a] + nums[b] + nums[c] + nums[d]`).

5. Update pointers based on the sum and skip duplicates.

6. Repeat the process for all possible combinations of `a`, `b`, `c`, and `d`.

7. Return the `result` array containing unique quadruplets that sum up to the target value.

**Note:** This solution assumes that the input array `nums` is sorted. If the input array is not sorted, you may need to add a sorting step before using this function.

Example usage:

```javascript
const nums = [1, 0, -1, 0, -2, 2];
const target = 0;
console.log(fourSum(nums, target));
```

This implementation efficiently finds all unique quadruplets that add up to the target value using a combination of nested loops and the two-pointer approach.



















  
