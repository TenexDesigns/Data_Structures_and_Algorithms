Climbing Stairs Algorithm:

The climbing stairs algorithm calculates the number of distinct ways to reach the top of a staircase by either climbing 1 or 2 steps at a time.

Time Complexity: The time complexity of the climbing stairs algorithm is O(n), where n is the number of steps in the staircase.

What It Does: Given a staircase with n steps, the climbing stairs algorithm calculates the total number of distinct ways to reach the top by either climbing 1 or 2 steps at a time.

Heres an example of implementing the climbing stairs algorithm in JavaScript:

function climbStairs(n) {
  if (n <= 2) return n;

  let first = 1;
  let second = 2;

  for (let i = 3; i <= n; i++) {
    const third = first + second;
    first = second;
    second = third;
  }

  return second;
}

console.log(climbStairs(4)); // Output: 5 (1 + 1 + 1 + 1, 1 + 1 + 2, 1 + 2 + 1, 2 + 1 + 1, 2 + 2)



MORE EXPLANANTION
************************************************************************************************************************************************

    Climbing Staircase Algorithm
    
The climbing staircase problem is a common algorithmic problem. It asks: given a staircase with n steps, and the ability to climb either 1 or 2 steps at a time, how many distinct ways are there to reach the top?

This problem can be solved with a dynamic programming algorithm. Here is an implementation of the climbing staircase algorithm in JavaScript:

function climbStairs(n) {
    if(n == 1) {
        return 1;
    }
    let dp = new Array(n + 1);
    dp[0] = 1;
    dp[1] = 2;
    for(let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}




    
