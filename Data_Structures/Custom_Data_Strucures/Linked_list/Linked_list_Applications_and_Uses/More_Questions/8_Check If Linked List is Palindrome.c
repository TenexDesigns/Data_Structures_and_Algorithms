A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward. In other words, a palindrome remains the same even when its order is reversed.

For example:

1. "radar" is a palindrome because it reads the same in both directions.
2. "level" is a palindrome as well.
3. "madam" is a palindrome.
4. "12321" is a numeric palindrome, as it reads the same backward.
5. "civic, radar, level, rotor, kayak, madam, and refer"
6. "otator, deified, racecar ,reviver" ---> Long Ones 
7. "edivider, kinnikinnik ,tattarrattat "  ---> Linger ones

Palindromes are an interesting concept and can be found in various aspects of language, mathematics, and even in everyday life. Checking if a sequence is a palindrome is a common problem in programming and is often used to verify data integrity or to implement certain algorithms. In the context of linked lists, as we discussed earlier, checking if a linked list is a palindrome involves comparing the values of nodes from both ends of the list to see if they match, which is one of the ways to check for palindromes in a linked list.

--------------
To check if a linked list is a palindrome in JavaScript, you can use a singly linked list. A palindrome is a string that reads the same forward and backward. In the context of a linked list, a linked list is a palindrome if the sequence of data in the nodes is the same if traversed forward and backward.

One approach to solve this problem is by using a stack. The idea is to push all elements of the linked list into a stack, and then pop elements from the stack to compare with the elements in the original linked list. If all the elements match, then the linked list is a palindrome. This approach involves two traversals of the linked list and uses O(n) extra space.

Here is a step-by-step JavaScript implementation:

Define a Node class to represent each node in the linked list:
class Node {
    constructor(val) {
        this.data = val;
        this.next = null;
    }
}
Declare a head variable to represent the head of the linked list:
var head;
Define a function isPalindrome(head) that checks if the linked list is a palindrome:
function isPalindrome(head) {
    var slow = head;
    var stack = [];

    // Push all elements of the list to the stack
    while (slow != null) {
        stack.push(slow.data);
        slow = slow.next;
    }

    // Iterate through the list again and
    // check by popping elements from stack
    while (head != null) {
        var i = stack.pop();

        // If data doesn't match, return false
        if (head.data == i) {
            head = head.next;
        } else {
            return false;
        }
    }

    return true;
}









Check Palidrum Using Stack
********************************************************************************************************

Sure, let's break down the process step by step:

**Step 1: Implement a Linked List with Palindrome**
First, we'll implement a simple linked list that can store integers and check if it forms a palindrome.

```javascript
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
  }

  append(val) {
    const newNode = new ListNode(val);
    if (!this.head) {
      this.head = newNode;
    } else {
      let current = this.head;
      while (current.next) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  print() {
    let current = this.head;
    const elements = [];
    while (current) {
      elements.push(current.val);
      current = current.next;
    }
    console.log(elements.join(" -> "));
  }
}

// Create a linked list with palindrome: 1 -> 2 -> 3 -> 2 -> 1
const linkedList = new LinkedList();
linkedList.append(1);
linkedList.append(2);
linkedList.append(3);
linkedList.append(2);
linkedList.append(1);
linkedList.print(); // Output: 1 -> 2 -> 3 -> 2 -> 1
```

**Step 2: Check If Linked List is Palindrome using Stack**
Next, we'll use a stack to check if the linked list is a palindrome.

```javascript
function isPalindrome(head) {
  if (!head || !head.next) {
    // An empty list or a list with only one node is a palindrome
    return true;
  }

  // Step 1: Traverse the linked list and store the values in a stack
  const stack = [];
  let current = head;
  while (current) {
    stack.push(current.val);
    current = current.next;
  }

  // Step 2: Traverse the linked list again and compare values with the stack
  current = head;
  while (current) {
    if (current.val !== stack.pop()) {
      return false;
    }
    current = current.next;
  }

  return true;
}

// Check if the linked list is a palindrome
console.log(isPalindrome(linkedList.head)); // Output: true
```

**Explanation:**
1. We created a simple linked list with palindrome in Step 1.

2. In Step 2, we defined a function `isPalindrome` that takes the head of the linked list as an input parameter.

3. We first check if the list is empty or has only one node. If so, it is considered a palindrome, and we directly return `true`.

4. To check if the linked list is a palindrome, we traverse the linked list and store the values in a stack.

5. We then traverse the linked list again and compare its values with the values popped from the stack. If any value mismatch is found, we immediately return `false`, indicating that the linked list is not a palindrome.

6. If all values match during the traversal, we return `true`, indicating that the linked list is a palindrome.

7. We called the `isPalindrome` function with the head of the linked list created in Step 1 and printed the result, which is `true` since the linked list forms a palindrome.

Using a stack to check if a linked list is a palindrome simplifies the process of comparison and ensures that we are able to compare elements in reverse order efficiently.









Using Recursion
********************************************************************************************************

To check if a linked list is a palindrome using recursion, we can follow the following approach:

**Approach:**
1. Initialize a global variable to keep track of the current node during the recursive calls.
2. Recursively traverse the linked list till the end of the list, while also moving the current node pointer to the last node.
3. During the backtracking phase of the recursion, compare the current node's value with the value of the node pointed to by the recursive call.
4. If the values are not equal at any point during the backtracking, return `false`, indicating that the linked list is not a palindrome.
5. If the backtracking phase completes without any mismatches, return `true`, indicating that the linked list is a palindrome.

**Which linked list to use:**
To use this approach, you need to have access to the head of the linked list.

**Reasoning behind the solution:**
Using recursion allows us to effectively traverse the linked list in both forward and backward directions. We compare the first and last nodes, then move towards the center of the list, comparing the corresponding nodes from both ends. If all values match during the backtracking phase, the linked list is a palindrome.

Here's a JavaScript implementation of checking if a linked list is a palindrome using recursion:

```javascript
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function isPalindrome(head) {
  let current = head;

  function isPalindromeRecursive(node) {
    if (!node) {
      // Base case: Reached the end of the list (null node)
      return true;
    }

    // Recursively move to the end of the list
    const isSubListPalindrome = isPalindromeRecursive(node.next);

    // Compare values during the backtracking phase
    const isEqual = current.val === node.val;

    // Move the current node pointer towards the center of the list
    current = current.next;

    // Return false if any value mismatch is found
    if (!isSubListPalindrome || !isEqual) {
      return false;
    }

    return true;
  }

  return isPalindromeRecursive(head);
}
```

**Explanation:**
1. The `isPalindrome` function takes the head of the linked list as an input parameter.

2. It initializes a pointer `current` to the head of the linked list. This pointer will be used to move from the beginning of the list towards the center.

3. The function defines a helper function `isPalindromeRecursive`, which takes a node of the linked list as a parameter.

4. The `isPalindromeRecursive` function is a recursive function that checks if the linked list starting from the current node is a palindrome.

5. The base case of the recursion is when the input node is `null`, which indicates the end of the list. In this case, the function returns `true`.

6. During the recursive calls, the function moves towards the end of the list by calling itself with the `next` node.

7. During the backtracking phase of the recursion, the function compares the value of the current node (`current.val`) with the value of the node pointed to by the recursive call (`node.val`). If these values are not equal, the function returns `false`, indicating that the linked list is not a palindrome.

8. The function then moves the `current` pointer towards the center of the list by setting it to the next node (`current = current.next`).

9. If the recursive call and value comparisons complete without any mismatches, the function returns `true`, indicating that the linked list is a palindrome.

10. The `isPalindrome` function returns the result of the recursive call `isPalindromeRecursive(head)`, indicating whether the entire linked list is a palindrome or not.

To use this function, you can create a linked list and then call the `isPalindrome` function with the head of the linked list. The function will return `true` if the linked list is a palindrome and `false` otherwise.













Using Recursion
---------------------------------------------------------------------------------------------------------------------

To check if a linked list is a palindrome using recursion in JavaScript, you can use a singly linked list. A palindrome is a string that reads the same forward and backward. In the context of a linked list, a linked list is a palindrome if the sequence of data in the nodes is the same if traversed forward and backward.

The recursive method works by comparing the first and last nodes, then the second and second last nodes, and so on. This is done by reaching the end of the linked list by recursion and then comparing the nodes as the recursive calls return. A helper function is used to keep track of the current node at the beginning of the linked list during the recursion.

Here is a step-by-step JavaScript implementation:

Define a Node class to represent each node in the linked list:
class Node {
    constructor(val) {
        this.data = val;
        this.next = null;
    }
}
Declare a head variable to represent the head of the linked list:
var head;
Define a function isPalindromeRecursion(left, right) that checks if the linked list is a palindrome using recursion:
function isPalindromeRecursion(left, right) {
    // base case
    if (right == null) {
        return true;
    }

    var result = isPalindromeRecursion(left, right.next) && (left[0].data == right.data);
    left[0] = left[0].next;

    return result;
}
Define a function isPalindrome(head) that wraps the head node and calls isPalindromeRecursion(left, right):
function isPalindrome(head) {
    return isPalindromeRecursion([head], head);
}
Define a push(new_data) function that inserts a new Node at the front of the list:
function push(new_data) {
    var new_node = new Node(new_data);
    new_node.next = head;
    head = new_node;
}
Now, you can test the isPalindrome(head) function with a sample linked list:
push('a');
push('b');
push('a');
push('c');
push('a');
push('b');
push('a');

console.log("Is palindrome: " + isPalindrome(head));
This will create a linked list with nodes a->b->a->c->a->b->a. The isPalindrome(head) function will return true as the linked list is a palindrome techiedelight.com.















