Sure! Here are more problems and their solutions using linked lists, along with their applications and uses:

1.Problem: Palindrome Linked List
Given a singly linked list, determine if it is a palindrome (reads the same forwards and backward).

Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function isPalindrome(head) {
  if (!head || !head.next) return true;

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

  // Compare the first half and reversed second half
  let left = head;
  let right = prev;
  while (right) {
    if (left.val !== right.val) return false;
    left = left.next;
    right = right.next;
  }

  return true;
}

// Usage example
const head1 = new ListNode(1);
head1.next = new ListNode(2);
head1.next.next = new ListNode(3);
head1.next.next.next = new ListNode(2);
head1.next.next.next.next = new ListNode(1);

const head2 = new ListNode(1);
head2.next = new ListNode(2);
head2.next.next = new ListNode(2);
head2.next.next.next = new ListNode(1);

console.log(isPalindrome(head1)); // Output: true
console.log(isPalindrome(head2)); // Output: true
Application: This problem can be used in various applications that require checking if a sequence of data is a palindrome, such as checking for symmetric patterns in data.





  
2.Problem: Merge k Sorted Lists
Merge k sorted linked lists and return it as one sorted list.

Solution:

javascript
Copy code
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function mergeKLists(lists) {
  const mergeTwoLists = (l1, l2) => {
    let dummy = new ListNode(0);
    let tail = dummy;

    while (l1 && l2) {
      if (l1.val < l2.val) {
        tail.next = l1;
        l1 = l1.next;
      } else {
        tail.next = l2;
        l2 = l2.next;
      }
      tail = tail.next;
    }

    tail.next = l1 || l2;
    return dummy.next;
  };

  if (lists.length === 0) return null;

  while (lists.length > 1) {
    let l1 = lists.shift();
    let l2 = lists.shift();
    const merged = mergeTwoLists(l1, l2);
    lists.push(merged);
  }

  return lists[0];
}

// Usage example
const list1 = new ListNode(1);
list1.next = new ListNode(4);
list1.next.next = new ListNode(5);

const list2 = new ListNode(1);
list2.next = new ListNode(3);
list2.next.next = new ListNode(4);

const list3 = new ListNode(2);
list3.next = new ListNode(6);

console.log(mergeKLists([list1, list2, list3]));
Application: This problem is used to merge multiple sorted lists into a single sorted list, which is essential in various sorting and searching algorithms.






    
3.Problem: Intersection of Two Linked Lists
Write a program to find the node at which the intersection of two singly linked lists begins.

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
const commonNode = new ListNode(8);
commonNode.next = new ListNode(4);
commonNode.next.next = new ListNode(5);

const headA = new ListNode(4);
headA.next = new ListNode(1);
headA.next.next = commonNode;

const headB = new ListNode(5);
headB.next = new ListNode(6);
headB.next.next = new ListNode(1);
headB.next.next.next = commonNode;

console.log(getIntersectionNode(headA, headB)); // Output: ListNode { val: 8, next: ListNode { val: 4, next: ListNode { val: 5, next: null } } }
Application: This problem can be used in applications that require finding the intersection point of two linked data structures, such as in network routing or pathfinding algorithms.

These are additional examples of using linked lists to solve problems in data structures and algorithms. Linked lists are versatile data structures with applications in various domains, including database management, graph algorithms, and data processing.




