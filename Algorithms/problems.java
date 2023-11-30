
//  1 Get Unique Numbers
const nums  = [1,2,3,1,21,2,98,9,6,7,56,54]
const numm = nums.filter(evens)

function evens(item,index,arr){

    return arr.indexOf(item) === index   //Reteruns index of first instance of a value, thefore repeaded value will result in false thus filtering out repeated values

}


console.log(numm)




//  2 Count of Unique Items

const num2 = ['a','b','c','d','a','b','a','b','c','d','r','a']


const count ={}


num2.forEach((item,index,arr)=>{
    if(count[item]){   //if Item alredy exists , increase its count by 1
        count[item]++
    }else{
        count[item] = 1  // If item does not exist set its count by 1
    }
})

console.log(count)



// problem 3   - Find the Largest number

const arr = [5,1444,2,3,4,55444444]


const ans = arr.reduce((acc,value,index,arr)=> {
   if(acc > value){
    return acc
   }else{
    return value
   }
},-Infinity)


console.log(ans)


//problem 5  // Also find the Largest number

function findLargestNumber(arr) {
    if (arr.length === 0) {
      return undefined; // Return undefined for an empty array, you can handle this case differently if needed
    }
  
    let maxNumber = arr[0]; // Assume the first element is the maximum
  
    for (let i = 1; i < arr.length; i++) {
      if (arr[i] > maxNumber) {
        maxNumber = arr[i];
      }
    }
  
    return maxNumber;
  }
  
  const arr3 = [5, 1444, 2, 3, 4, 55444444];
  const maxNumber = findLargestNumber(arr3);
  console.log(maxNumber); // Output: 55444444

  

//Splice mthod - Modifies an array by adding or removing items, It returns the  items, It also modfies the arry with the added or removed items
const arr5 = [5,1444,2,3,4,55444444]


const names = arr5.splice(3,0,6900)
const names2 = arr5.splice(3,3,6900)
console.log(names)
console.log(arr)




Let's analyze the time complexity of both functions for calculating the factorial of a number:

### Approach 1 (`fact2` function - Recursion):

```typescript
function fact2(n: number): number {
    if (n === 0 || n === 1) {
        return n;
    }
    return n * fact2(n - 1);
}
```

This approach uses recursion. The time complexity of this function is O(n) because, in the worst case, it makes n recursive calls (each with constant time work) until it reaches the base case.

### Approach 2 (`fact1` function - Iteration):

```typescript
function fact1(n: number): number {
    let result = 1;

    for (let i = 2; i <= n; i++) {
        result = result * i;
    }

    return result;
}
```

This approach uses iteration (a loop). The time complexity of this function is also O(n) because the loop iterates n times, and each iteration performs constant time work.

### Summary:
Both approaches have a time complexity of O(n) for calculating the factorial. However, the iterative approach (`fact1`) is generally more efficient and is preferred over the recursive approach (`fact2`) for calculating factorials, especially for large values of n. Recursion can lead to a stack overflow for very large values of n, while the iterative approach is more efficient in terms of both time and space.



In the Fibonacci sequence, the first two numbers are 0 and 1. This is why we return `n` in the base case when `n` is 0 or 1. 

In the factorial function, the base case is when `n` is 0 or 1, where we return `n` directly. This is because the factorial of 0 and 1 is 1. 

In the second approach of the factorial function, we start with `result` as 1 because the factorial of any number `n` is the product of all positive integers less than or equal to `n`. Since 1 is the smallest positive integer, we start with `result` as 1 and then multiply it by each integer from 2 to `n`.

In the Fibonacci sequence, we start with `a` and `b` as the first two numbers in the sequence, then in each iteration of the loop, we update `a` and `b` to the next two numbers in the sequence. This is why we start at 2 in the loop.







///
