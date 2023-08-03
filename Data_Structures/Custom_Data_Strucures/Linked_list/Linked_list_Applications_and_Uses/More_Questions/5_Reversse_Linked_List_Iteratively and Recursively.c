
ITERATIVE APPRACH
--------------------------------------------------------------------------------------------------------

To reverse a linked list in an iterative way, you can traverse the list while rearranging the pointers of each node. The idea is to change the direction of each link in the list, effectively reversing the order of the nodes.

**Approach:**
1. Initialize three pointers: `prev` (initialized to `null`), `current` (initialized to the head of the linked list), and `next` (initialized to `null`).
2. While `current` is not `null`:
   a. Save the next node to `next`.
   b. Point the `next` of the current node to the previous node (`prev`).
   c. Move `prev` to `current` and `current` to `next`.
3. Finally, set the head of the linked list to the last node, which would be the new head of the reversed list.

**Which linked list to use:**
To use this approach, you need to have access to the head of the linked list.

**Reasoning behind the solution:**
By changing the direction of the links as we traverse the linked list, we effectively reverse the order of the nodes. The `prev` pointer helps us keep track of the previous node so that we can update the links correctly.

Here's a JavaScript implementation of reversing a linked list iteratively:

```javascript
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function reverseLinkedList(head) {
  let prev = null;
  let current = head;
  let next = null;

  while (current !== null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  // Set the head of the reversed linked list
  head = prev;

  return head;
}
```

**Explanation:**
1. The `reverseLinkedList` function takes the head of the linked list as an input parameter.

2. It initializes three pointers: `prev` (initialized to `null`), `current` (initialized to the head of the linked list), and `next` (initialized to `null`).

3. The `while` loop runs as long as the `current` pointer is not `null`. Inside the loop:

   a. The `next` pointer is used to store the reference to the next node (`next = current.next`).

   b. The `next` of the current node is pointed to the previous node (`current.next = prev`), effectively reversing the link.

   c. The `prev` pointer is moved to the `current` node (`prev = current`).

   d. The `current` pointer is moved to the next node (`current = next`).

4. After the loop, the `head` of the reversed linked list is set to the last node (previously the first node) pointed by the `prev` pointer.

5. The function returns the new head of the reversed linked list.

To use this function, you can create a linked list and then call the `reverseLinkedList` function with the head of the linked list. The function will return the head of the reversed linked list.




RECURSIVE APPROACH
--------------------------------------------------------------------------------------------------------

Yes, it is possible to reverse a linked list using a recursive approach. In a recursive solution, we define a function that reverses the tail of the linked list and then adjusts the next pointer of the current node to reverse the link.

**Recursive Approach:**
1. The base case of the recursion is when the current node is `null` (end of the original list) or the next node is `null` (end of the reversed list).
2. For each recursive call, reverse the tail of the linked list.
3. Adjust the `next` pointer of the current node to point to the previous node in the reversed list.

Here's a JavaScript implementation of reversing a linked list using recursion:

```javascript
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function reverseLinkedListRecursive(head) {
  if (head === null || head.next === null) {
    return head;
  }

  const reversedTail = reverseLinkedListRecursive(head.next);
  head.next.next = head;
  head.next = null;

  return reversedTail;
}
```

**Explanation:**
1. The `reverseLinkedListRecursive` function takes the head of the linked list as an input parameter.

2. The base case of the recursion checks if the current node is `null` or the next node is `null`. If any of these conditions is true, it means we have reached the end of the original list, and we simply return the current node.

3. For each recursive call, we reverse the tail of the linked list by calling the function with `head.next`. The recursive call will continue until it reaches the end of the original list.

4. After the recursive call, we have the `reversedTail`, which is the head of the reversed list starting from the next node.

5. We adjust the `next` pointer of the current node (`head`) to point to `null`, effectively reversing the link.

6. Finally, we return the `reversedTail`, which is the new head of the reversed linked list.

To use this function, you can create a linked list and then call the `reverseLinkedListRecursive` function with the head of the linked list. The function will return the head of the reversed linked list. Keep in mind that recursive solutions can have a higher space complexity due to the recursive call stack, so for very long lists, the iterative approach may be more efficient.

