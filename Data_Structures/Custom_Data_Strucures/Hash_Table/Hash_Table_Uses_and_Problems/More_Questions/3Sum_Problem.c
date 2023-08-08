Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.















------------------------------------------------------------------------------
To solve the problem of finding triplets with a sum of 0 in an integer array using recursion in JavaScript, you can follow these steps:

1. Sort the array in ascending order. This is important for efficient traversal and avoiding duplicate triplets.
2. Define a recursive function, let's call it `findTripletsRecursive`, that takes the array, the current index, and an array to store the triplets as parameters.
3. In the `findTripletsRecursive` function, if the current index is greater than or equal to 2, start a nested loop to find the remaining two elements that sum to the negation of the current element.
4. Inside the nested loop, use two pointers, `left` and `right`, initialized to the indices immediately after the current index and at the end of the array, respectively.
5. Calculate the current sum by adding the current element with the elements at indices `left` and `right`.
6. If the current sum is 0, add the triplet `[current element, element at index left, element at index right]` to the result array.
7. If the current sum is less than 0, increment the `left` pointer to move towards higher values.
8. If the current sum is greater than 0, decrement the `right` pointer to move towards lower values.
9. Continue the nested loop until the `left` pointer is less than the `right` pointer.
10. After the nested loop, recursively call `findTripletsRecursive` with the next index to explore the remaining elements.
11. Finally, return the result array containing all the triplets.

Here's the code implementation:

```javascript
function findTriplets(arr) {
  const result = [];
  
  // Sort the array in ascending order
  arr.sort((a, b) => a - b);
  
  // Recursive function to find triplets
  function findTripletsRecursive(index, triplet) {
    if (triplet.length === 3) {
      if (triplet.reduce((sum, num) => sum + num, 0) === 0) {
        result.push(triplet.slice());
      }
      return;
    }
    
    for (let i = index; i < arr.length; i++) {
      // Avoid duplicate elements in the triplet
      if (i > index && arr[i] === arr[i - 1]) continue;
      
      triplet.push(arr[i]);
      findTripletsRecursive(i + 1, triplet);
      triplet.pop();
    }
  }
  
  findTripletsRecursive(0, []);
  
  return result;
}

// Example usage:
const nums = [-1, 0, 1, 2, -1, -4];
const triplets = findTriplets(nums);
console.log(triplets);
```

This code will output `[[ -1, -1, 2 ], [ -1, 0, 1 ]]`, which are the distinct triplets with a sum of 0 in the given `nums` array.

The reasoning behind using memoization in this solution is that memoization is not necessary for this specific problem. The recursive function explores all possible combinations of triplets without overlapping subproblems, so there are no redundant calculations to avoid.

Its worth noting that the time complexity of this solution is O(n^2), where n is the length of the input array. The sorting operation takes O(n log n) time, and the nested loop inside the recursive function takes O(n) time.

AVOID DUPLETES
  -------------------------

  In the provided solution for the "3Sum problem, unique triplets are ensured through careful handling of duplicates while iterating through the array and finding the triplets. Here's how the solution ensures unique triplets:

1. **Sorting:** The array is sorted in non-decreasing order before processing. Sorting the array helps in identifying duplicates and also allows us to efficiently use the two-pointer approach.

2. **Skip Duplicate Starting Elements:** While iterating through the array with the main loop, if the current element is a duplicate of the previous element, we skip it. This step ensures that we consider only unique starting elements for triplets. This is achieved by the following code snippet:

   ```javascript
   if (i > 0 && nums[i] === nums[i - 1]) {
       continue; // Skip duplicates
   }
   ```

3. **Skip Duplicate Elements Inside the Loop:** Inside the loop that uses the two-pointer approach, we skip duplicates by incrementing the `left` pointer while the next element is the same as the current one, and decrementing the `right` pointer while the previous element is the same as the current one:

   ```javascript
   while (nums[left] === nums[left + 1]) left++; // Skip duplicates
   while (nums[right] === nums[right - 1]) right--; // Skip duplicates
   ```

By carefully skipping duplicates in both the main loop and the two-pointer approach, the solution ensures that the resulting triplets are unique. This is crucial because the problem statement specifies that the solution set must not contain duplicate triplets.

With these steps, the solution avoids generating duplicate triplets while searching for all unique triplets that sum up to zero.



APPROACH TWO
--------------------------------------------------------------------------------------------------------------------------------------------------



This problem is commonly known as the "3Sum" problem. The goal is to find all unique triplets in an array that sum up to zero. Here's the solution in JavaScript, along with an explanation for both the provided example and the second case:

```javascript
function threeSum(nums) {
    const result = [];
    nums.sort((a, b) => a - b); // Sort the array in non-decreasing order

    for (let i = 0; i < nums.length - 2; i++) {
        if (i > 0 && nums[i] === nums[i - 1]) {
            continue; // Skip duplicates
        }
        
        let left = i + 1;
        let right = nums.length - 1;

        while (left < right) {
            const sum = nums[i] + nums[left] + nums[right];

            if (sum === 0) {
                result.push([nums[i], nums[left], nums[right]]);
                while (nums[left] === nums[left + 1]) left++; // Skip duplicates
                while (nums[right] === nums[right - 1]) right--; // Skip duplicates
                left++;
                right--;
            } else if (sum < 0) {
                left++;
            } else {
                right--;
            }
        }
    }

    return result;
}
```

**Explanation:**

1. We start by sorting the array in non-decreasing order to help with finding unique triplets and efficiently using the two-pointer approach.

2. We iterate through the array using a loop, considering each element as a potential starting element of a triplet.

3. For each element at index `i`, we use two pointers `left` and `right` to find the other two elements that sum to zero.

4. Inside the loop, we check if the current element is a duplicate. If it is, we skip it to avoid duplicate triplets.

5. We then calculate the sum of the three elements (`nums[i]`, `nums[left]`, and `nums[right]`).

6. If the sum is zero, we've found a triplet that adds up to zero. We add this triplet to the result array and increment `left` and decrement `right` while skipping any duplicates.

7. If the sum is less than zero, we move the `left` pointer to the right to consider larger values.

8. If the sum is greater than zero, we move the `right` pointer to the left to consider smaller values.

9. We continue this process until the `left` pointer is less than the `right` pointer.

10. After finishing the loop, we return the `result` array containing all the unique triplets that sum up to zero.

**Example 1:**
Input: `nums = [-1, 0, 1, 2, -1, -4]`
Output: `[[-1, -1, 2], [-1, 0, 1]]`
Explanation: The distinct triplets are `[-1, 0, 1]` and `[-1, -1, 2]`.

**Example 2:**
Input: `nums = [-3, 3, 4, -3, 1, 2]`
Output: `[[-3, 1, 2], [-3, 3, 0]]`
Explanation: The distinct triplets are `[-3, 1, 2]` and `[-3, 3, 0]`.

The solution efficiently finds all unique triplets that sum up to zero using the two-pointer approach and proper handling of duplicates.



-

The time and space complexity of the provided solution for the "3Sum" problem is as follows:

**Time Complexity:** O(n^2)
- Sorting the array takes O(n log n) time complexity.
- The main loop iterates through the array, which takes O(n) time.
- Inside the loop, the two-pointer approach performs operations that are O(n) in total because `left` and `right` pointers move towards each other.
- Overall, the time complexity is dominated by sorting and the main loop, resulting in O(n log n + n^2), which simplifies to O(n^2) as the dominant term.

**Space Complexity:** O(1)
- The solution uses a constant amount of extra space regardless of the input size.
- The `result` array stores the triplets found, but it's not counted in space complexity since it's part of the output.
- The sorting operation doesn't require extra space as it's done in-place.
- The two-pointer approach and other variables used have a constant space requirement.

In summary, the solution has a time complexity of O(n^2) and a space complexity of O(1), making it an efficient and space-efficient approach to solve the "3Sum" problem.





























