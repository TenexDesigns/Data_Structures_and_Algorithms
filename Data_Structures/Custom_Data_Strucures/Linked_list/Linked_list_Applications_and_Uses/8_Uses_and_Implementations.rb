Sure! Here are some problems and their solutions using linked lists, along with their applications and uses:

1.Problem: Add Two Numbers
Given two non-empty linked lists representing two non-negative integers, with digits stored in reverse order, add the two numbers and return the sum as a linked list.

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
  let dummyHead = new ListNode(0);
  let curr = dummyHead;
  let carry = 0;

  while (l1 || l2) {
    let x = l1 ? l1.val : 0;
    let y = l2 ? l2.val : 0;
    let sum = x + y + carry;

    carry = Math.floor(sum / 10);
    curr.next = new ListNode(sum % 10);

    curr = curr.next;
    if (l1) l1 = l1.next;
    if (l2) l2 = l2.next;
  }

  if (carry > 0) {
    curr.next = new ListNode(carry);
  }

  return dummyHead.next;
}

// Usage example
const l1 = new ListNode(2);
l1.next = new ListNode(4);
l1.next.next = new ListNode(3);

const l2 = new ListNode(5);
l2.next = new ListNode(6);
l2.next.next = new ListNode(4);

const result = addTwoNumbers(l1, l2); // Output: 7 -> 0 -> 8
Application: This problem simulates adding two large numbers represented as linked lists, which can be useful in handling large integer values in programming.





      
2.Problem: Merge Two Sorted Lists
Given two sorted linked lists, merge them into a single sorted linked list and return the new list.

Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function mergeTwoLists(l1, l2) {
  let dummyHead = new ListNode(0);
  let curr = dummyHead;

  while (l1 && l2) {
    if (l1.val < l2.val) {
      curr.next = l1;
      l1 = l1.next;
    } else {
      curr.next = l2;
      l2 = l2.next;
    }
    curr = curr.next;
  }

  if (l1) {
    curr.next = l1;
  } else {
    curr.next = l2;
  }

  return dummyHead.next;
}

// Usage example
const l1 = new ListNode(1);
l1.next = new ListNode(2);
l1.next.next = new ListNode(4);

const l2 = new ListNode(1);
l2.next = new ListNode(3);
l2.next.next = new ListNode(4);

const mergedList = mergeTwoLists(l1, l2); // Output: 1 -> 1 -> 2 -> 3 -> 4 -> 4
Application: This problem is used to merge and sort two lists, which is a common operation in many algorithms and applications.




    
3.Problem: Detect Cycle in a Linked List
Given a linked list, determine if it has a cycle in it. A cycle occurs when a nodes next pointer points back to a previously visited node.

Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function hasCycle(head) {
  let slow = head;
  let fast = head;

  while (fast && fast.next) {
    slow = slow.next;
    fast = fast.next.next;

    if (slow === fast) {
      return true;
    }
  }

  return false;
}

// Usage example
const node1 = new ListNode(3);
const node2 = new ListNode(2);
const node3 = new ListNode(0);
const node4 = new ListNode(-4);

node1.next = node2;
node2.next = node3;
node3.next = node4;
node4.next = node2; // Cycle between node2 and node3

console.log(hasCycle(node1)); // Output: true
Application: This problem is used to detect cycles in linked lists, which is essential in algorithms like Floyds cycle-finding algorithm and cycle detection in graphs.




    
4.Problem: Intersection of Two Linked Lists
Given two linked lists, find the node where they intersect (if any).

Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function getIntersectionNode(headA, headB) {
  let currA = headA;
  let currB = headB;

  while (currA !== currB) {
    currA = currA === null ? headB : currA.next;
    currB = currB === null ? headA : currB.next;
  }

  return currA;
}

// Usage example
const node1 = new ListNode(1);
const node2 = new ListNode(2);
const node3 = new ListNode(3);

node1.next = node2;
node2.next = node3;

const node4 = new ListNode(4);
const node5 = new ListNode(5);

node4.next = node5;
node5.next = node2; // Intersection point with node2

console.log(getIntersectionNode(node1, node4).val); // Output: 2
Application: This problem is used to find the intersection node of two linked lists, which can be applied in various algorithms, such as finding the common node in two paths.

These are just a few examples of using linked lists to solve problems in data structures and algorithms. Linked lists are widely used in various applications, including memory management, task scheduling, graph algorithms, etc. They provide a flexible and efficient way to manage and process data in a sequential manner.








  
