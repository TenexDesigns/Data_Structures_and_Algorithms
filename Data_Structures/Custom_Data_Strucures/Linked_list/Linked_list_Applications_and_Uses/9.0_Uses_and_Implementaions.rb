Sure! Here are more problems and their solutions using linked lists, along with their applications and uses:

1.Problem: Remove Nth Node From End of List
Given a linked list, remove the n-th node from the end of the list and return the modified list.

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
  let dummyHead = new ListNode(0);
  dummyHead.next = head;

  let fast = dummyHead;
  let slow = dummyHead;

  // Move fast n+1 steps ahead of slow
  for (let i = 0; i <= n; i++) {
    fast = fast.next;
  }

  // Move both fast and slow until fast reaches the end
  while (fast !== null) {
    fast = fast.next;
    slow = slow.next;
  }

  // Remove the nth node from the end
  slow.next = slow.next.next;

  return dummyHead.next;
}

// Usage example
const head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
head.next.next.next = new ListNode(4);
head.next.next.next.next = new ListNode(5);

const modifiedList = removeNthFromEnd(head, 2); // Output: 1 -> 2 -> 3 -> 5
Application: This problem is used in various algorithms that require removing a specific node from the end of a linked list, such as in memory management systems or log processing.





  
2.Problem: Reorder List
Given a singly linked list, reorder it to form the list: L1 -> Ln -> L2 -> Ln-1 -> L3 -> Ln-2 -> ...
The reorder must be done in-place, without using extra memory.

Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function reorderList(head) {
  if (!head || !head.next) return;

  // Find the middle of the list
  let slow = head;
  let fast = head;
  while (fast.next && fast.next.next) {
    slow = slow.next;
    fast = fast.next.next;
  }

  // Reverse the second half of the list
  let prev = null;
  let curr = slow.next;
  while (curr) {
    let next = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  }
  slow.next = null;

  // Merge the two halves of the list
  let l1 = head;
  let l2 = prev;
  while (l2) {
    let temp1 = l1.next;
    let temp2 = l2.next;
    l1.next = l2;
    l2.next = temp1;
    l1 = temp1;
    l2 = temp2;
  }
}

// Usage example
const head = new ListNode(1);
head.next = new ListNode(2);
head.next.next = new ListNode(3);
head.next.next.next = new ListNode(4);
head.next.next.next.next = new ListNode(5);

reorderList(head); // Output: 1 -> 5 -> 2 -> 4 -> 3
Application: This problem is used to rearrange the elements of a linked list to create a specific pattern, which can be applied in various list-based applications.






    
3.Problem: Flatten a Multilevel Doubly Linked List
Given a doubly linked list where in addition to the next and previous pointers, it has a child pointer that may or may not point to a separate doubly linked list. Flatten the list so that all the nodes appear in a single-level, doubly linked list.

Solution:

javascript
Copy code
class Node {
  constructor(val, prev, next, child) {
    this.val = val;
    this.prev = prev;
    this.next = next;
    this.child = child;
  }
}

function flatten(head) {
  if (!head) return null;

  let curr = head;
  while (curr) {
    if (curr.child) {
      let next = curr.next;
      let child = curr.child;

      curr.next = child;
      child.prev = curr;
      curr.child = null;

      let tail = child;
      while (tail.next) {
        tail = tail.next;
      }

      if (next) {
        tail.next = next;
        next.prev = tail;
      }
    }
    curr = curr.next;
  }

  return head;
}

// Usage example
const head = new Node(1);
const node2 = new Node(2);
const node3 = new Node(3);
const node4 = new Node(4);
const node5 = new Node(5);
const node6 = new Node(6);

head.next = node2;
node2.prev = head;
node2.next = node3;
node3.prev = node2;
node3.next = node4;
node4.prev = node3;
node4.next = node5;
node5.prev = node4;
node5.next = node6;
node6.prev = node5;

const headWithChild = new Node(7);
const node8 = new Node(8);
const node9 = new Node(9);
const node10 = new Node(10);

head.child = headWithChild;
headWithChild.next = node8;
node8.prev = headWithChild;
node8.next = node9;
node9.prev = node8;
node9.next = node10;
node10.prev = node9;

flatten(head); // Output: 1 -> 7 -> 8 -> 9 -> 10 -> 2 -> 3 -> 4 -> 5 -> 6
Application: This problem is used to flatten a nested structure of linked lists, which can be useful in various tree-based data structures and algorithms.

These are additional examples of using linked lists to solve problems in data structures and algorithms. Linked lists are versatile data structures with applications in various domains, including database management, graph algorithms, and data processing.




