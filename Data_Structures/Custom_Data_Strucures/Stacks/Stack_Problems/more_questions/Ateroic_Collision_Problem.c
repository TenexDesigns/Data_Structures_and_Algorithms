We are given an array asteroids of integers representing asteroids in a row.

For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

 

Example 1:

Input: asteroids = [5,10,-5]
Output: [5,10]
Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.,How do I solve this problem, a nd what is the resonong behind the solution, explain with code implememntiion iin javascript

Example 2:

Input: asteroids = [-1,3,2,-3]
Output: [-1]





To solve this problem, you can use a stack to simulate the collisions between asteroids while considering their sizes and directions. Here's how you can implement the solution in JavaScript:

```javascript
function asteroidCollision(asteroids) {
    const stack = [];

    for (const asteroid of asteroids) {
        if (asteroid > 0) {
            stack.push(asteroid);
        } else {
            while (stack.length > 0 && stack[stack.length - 1] > 0 && stack[stack.length - 1] < Math.abs(asteroid)) {
                stack.pop();
            }
            if (stack.length === 0 || stack[stack.length - 1] < 0) {
                stack.push(asteroid);
            }
            if (stack.length > 0 && stack[stack.length - 1] === Math.abs(asteroid)) {
                stack.pop();
            }
        }
    }

    return stack;
}

// Test case
const asteroids = [-1, 3, 2, -3];
const result = asteroidCollision(asteroids);
console.log(result); // Output: [-1]
```

**Explanation:**

1. Initialize an empty stack to represent the state of asteroids after collisions.

2. Iterate through each asteroid in the given array.

3. For each asteroid:
   - If the asteroid is moving to the right (positive), push it onto the stack.
   - If the asteroid is moving to the left (negative), handle potential collisions:
      - While there are asteroids in the stack moving to the right, and the top asteroid's size is smaller than the absolute value of the current asteroid, pop the right-moving asteroids that will be destroyed by the current asteroid.
      - If the stack is empty or the top asteroid is moving to the left, push the current asteroid onto the stack.
      - If the top asteroid's size is equal to the absolute value of the current asteroid (both asteroids will be destroyed), pop the top asteroid from the stack.

4. After processing all asteroids, the stack will contain the state of asteroids after all collisions.

The reasoning behind this solution is similar to the previous explanation. You're using the stack to simulate the movement of asteroids and handle their collisions. When a new asteroid comes in, you check its direction and size compared to the top of the stack. Depending on the conditions, you decide whether the asteroid survives the collision or not.

This approach ensures that you handle collisions between asteroids correctly, considering their sizes and directions. The time complexity of this solution is O(n), where n is the number of asteroids in the input array.
