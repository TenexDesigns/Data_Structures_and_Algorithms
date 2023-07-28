Sure! Here are some more problems, solutions, and applications of linked lists:

1.Problem: Add Two Numbers Represented by Linked Lists
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function addTwoNumbers(l1, l2) {
  let dummy = new ListNode(0);
  let current = dummy;
  let carry = 0;

  while (l1 || l2) {
    let sum = (l1 ? l1.val : 0) + (l2 ? l2.val : 0) + carry;
    carry = Math.floor(sum / 10);
    current.next = new ListNode(sum % 10);
    current = current.next;

    if (l1) l1 = l1.next;
    if (l2) l2 = l2.next;
  }

  if (carry > 0) {
    current.next = new ListNode(carry);
  }

  return dummy.next;
}

// Usage example
const l1 = new ListNode(2);
l1.next = new ListNode(4);
l1.next.next = new ListNode(3);

const l2 = new ListNode(5);
l2.next = new ListNode(6);
l2.next.next = new ListNode(4);

console.log(addTwoNumbers(l1, l2)); // Output: ListNode { val: 7, next: ListNode { val: 0, next: ListNode { val: 8, next: null } } }
Application: This problem is used in scenarios where numbers are too large to be represented as standard data types. Linked lists allow us to store and process large numbers efficiently.





      
2.Problem: Reverse Linked List
Reverse a singly linked list.
Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function reverseLinkedList(head) {
  let prev = null;
  let current = head;
  while (current) {
    const next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  return prev;
}

// Usage example
const head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
head.next.next.next = new ListNode(4);
head.next.next.next.next = new ListNode(5);

console.log(reverseLinkedList(head));
Application: This problem can be used in scenarios where it is necessary to reverse the order of elements, such as reversing a list of tasks or events.






  
3.Problem: Remove Nth Node From End of List
Given the head of a linked list, remove the nth node from the end of the list and return its head.
Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function removeNthFromEnd(head, n) {
  let dummy = new ListNode(0);
  dummy.next = head;
  let slow = dummy;
  let fast = dummy;

  // Move fast pointer n+1 steps ahead
  for (let i = 0; i <= n; i++) {
    fast = fast.next;
  }

  // Move both slow and fast pointers until fast reaches the end
  while (fast) {
    slow = slow.next;
    fast = fast.next;
  }

  // Remove the nth node
  slow.next = slow.next.next;

  return dummy.next;
}

// Usage example
const head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
head.next.next.next = new ListNode(4);
head.next.next.next.next = new ListNode(5);

console.log(removeNthFromEnd(head, 2));
Application: This problem can be used in scenarios where it is required to delete elements from the end of the list based on their positions, such as removing outdated records from a log.

Linked lists have numerous applications in computer science and software engineering, including:

Implementing various data structures like stacks, queues, and hash tables.
Representing sparse matrices and adjacency lists for graphs.
Implementing memory management and garbage collection algorithms.
Parsing and processing data in compilers and interpreters.
Implementing algorithms for numerical computing and simulations.

  
These examples demonstrate the versatility and usefulness of linked lists in solving various problems and building efficient data structures and algorithms.




