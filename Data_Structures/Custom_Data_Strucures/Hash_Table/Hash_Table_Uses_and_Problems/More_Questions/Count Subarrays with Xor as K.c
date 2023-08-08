Given an array of integers arr[] and a number m, count the number of subarrays having XOR of their elements as m.



-------------------------------------------------------------
To count the number of subarrays with a given XOR in JavaScript, you can use the following algorithms:

Algorithm 1: Using Prefix XOR and Map
1. Define a function `subarrayXor` that takes an array `arr`, the length of the array `n`, and the target XOR `m` as parameters.
2. Initialize a variable `ans` to 0, which will store the count of subarrays with XOR equal to `m`.
3. Create an array `xorArr` of length `n` to store the prefix XOR values.
4. Create a Map `mp` to store the number of prefix array elements corresponding to a XOR value.
5. Calculate the prefix XOR array `xorArr` by iterating over the elements of `arr` and taking the XOR of the current element with the previous XOR value.
6. Iterate over the elements of `xorArr` using a loop:
   - Calculate the XOR of the current prefix with `m` and store it in a variable `tmp`.
   - Check if `tmp` exists in the map. If it does, add the value corresponding to `tmp` to `ans`.
   - If the current prefix XOR is equal to `m`, increment `ans` by 1.
   - Add the XOR of the current subarray to the map. If it already exists, increment its value by 1; otherwise, set its value to 1.
7. Return the total count of subarrays having XOR of elements equal to `m`, which is stored in `ans`.

Here's the JavaScript implementation of Algorithm 1:

```javascript
function subarrayXor(arr, n, m) {
  let ans = 0;
  let xorArr = new Array(n);
  let mp = new Map();

  xorArr[0] = arr[0];
  for (let i = 1; i < n; i++) {
    xorArr[i] = xorArr[i - 1] ^ arr[i];
  }

  for (let i = 0; i < n; i++) {
    let tmp = m ^ xorArr[i];
    ans += mp.has(tmp) ? mp.get(tmp) : 0;
    if (xorArr[i] === m) {
      ans++;
    }
    if (mp.has(xorArr[i])) {
      mp.set(xorArr[i], mp.get(xorArr[i]) + 1);
    } else {
      mp.set(xorArr[i], 1);
    }
  }

  return ans;
}

const arr = [4, 2, 2, 6, 4];
const n = arr.length;
const m = 6;
console.log("Number of subarrays having given XOR is " + subarrayXor(arr, n, m));
```

Algorithm 2: Simple Approach using Two Loops
1. Define a function `subarraysWithXorK` that takes an array `a` and a target XOR `k` as parameters.
2. Initialize a variable `cnt` to 0, which will store the count of subarrays with XOR equal to `k`.
3. Use two nested loops to generate all possible subarrays of `a`:
   - In the outer loop, iterate over the starting index `i` from 0 to the length of `a`.
   - In the inner loop, iterate over the ending index `j` from `i` to the length of `a`.
4. Calculate the XOR of all elements in the current subarray by taking the XOR of each element with the previous XOR value.
5. Check if the XOR of the current subarray is equal to `k`. If it is, increment `cnt` by 1.
6. Return `cnt` as the count of subarrays with XOR equal to `k`.

Here's the JavaScript implementation of Algorithm 2:

```javascript
function subarraysWithXorK(a, k) {
  const n = a.length;
  let cnt = 0;

  for (let i = 0; i < n; i++) {
    let xorr = 0;
    for (let j = i; j < n; j++) {
      xorr = xorr ^ a[j];
      if (xorr === k) {
        cnt++;
      }
    }
  }

  return cnt;
}

const a = [4, 2, 2, 6, 4];
const k = 6;
const ans = subarraysWithXorK(a, k);
console.log("The number of subarrays with XOR k is:", ans);
```

Both algorithms have different approaches to count the number of subarrays with a given XOR. Algorithm 1 has a time complexity of O(n),
while Algorithm 2 has a time complexity of O(n^2).







MORE EXPLAANNTION
----------------------------------------------------------------------------------

XOR (exclusive OR) is a bitwise operation that takes two binary numbers and returns a new binary number where each bit is the result of applying the XOR operation to the corresponding bits of the input numbers. In simple terms, it returns 1 if the two bits are different, and 0 if they are the same. Here's the truth table for XOR:

| A | B | A XOR B |
|---|---|---------|
| 0 | 0 |   0     |
| 0 | 1 |   1     |
| 1 | 0 |   1     |
| 1 | 1 |   0     |

Now, to solve the given problem using JavaScript, you can follow these steps:

1. Initialize a variable `count` to keep track of the number of subarrays with XOR equal to `m`.
2. Initialize a variable `xorSum` to keep track of the XOR sum of elements in the current subarray.
3. Create an empty object `xorMap` to store the frequency of XOR sums encountered so far.
4. Loop through the array `arr` using two nested loops: an outer loop to consider each starting index and an inner loop to consider each ending index of the subarray.
5. For each subarray, calculate the XOR sum of its elements.
6. Check if `xorSum ^ m` (XOR of `xorSum` and `m`) exists in the `xorMap`. If it does, increment `count` by the frequency of that XOR sum in `xorMap`.
7. Update the frequency of `xorSum` in the `xorMap`.
8. After both loops complete, return the `count` as the result.

Here's the JavaScript code that implements the above algorithm:

```javascript
function countSubarraysWithXOR(arr, m) {
    let count = 0;
    let xorSum = 0;
    let xorMap = { 0: 1 }; // Initialize with 0 XOR sum frequency of 1
    
    for (let i = 0; i < arr.length; i++) {
        xorSum ^= arr[i];
        
        if (xorMap[xorSum ^ m]) {
            count += xorMap[xorSum ^ m];
        }
        
        if (xorMap[xorSum]) {
            xorMap[xorSum]++;
        } else {
            xorMap[xorSum] = 1;
        }
    }
    
    return count;
}

const arr1 = [4, 2, 2, 6, 4];
const m1 = 6;
console.log(countSubarraysWithXOR(arr1, m1)); // Output: 4

const arr2 = [5, 6, 7, 8, 9];
const m2 = 5;
console.log(countSubarraysWithXOR(arr2, m2)); // Output: 2
```

This code should solve the given problem using the XOR concept and the algorithm explained above.












