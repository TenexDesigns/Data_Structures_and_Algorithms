To remove duplicates from a sorted linked list, you need to traverse the list and remove any nodes that have the same value as the previous node. Since the linked list is sorted, duplicates will occur consecutively. By updating the `next` pointers of nodes appropriately, you can remove duplicates in place.

**Approach:**
1. Start from the head of the linked list and initialize a pointer `current` to the head.
2. While `current` and `current.next` are not `null`, compare the values of `current` and `current.next`.
3. If the values are the same, update the `next` pointer of `current` to skip the duplicate node and directly point to the next distinct node.
4. If the values are different, move `current` to the next node.
5. Repeat this process until `current` or `current.next` becomes `null`.

**Which linked list to use:**
To use this approach, you need to have access to the head of the sorted linked list.

**Reasoning behind the solution:**
The sorted nature of the linked list allows us to identify duplicates easily. As we traverse the list, duplicate nodes will appear consecutively. By skipping the duplicate nodes and updating the `next` pointers, we can remove duplicates in place.

Here's a JavaScript implementation of removing duplicates from a sorted linked list:

```javascript
class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function removeDuplicatesFromSortedList(head) {
  let current = head;

  while (current !== null && current.next !== null) {
    if (current.val === current.next.val) {
      current.next = current.next.next; // Skip the duplicate node
    } else {
      current = current.next; // Move to the next distinct node
    }
  }

  return head;
}
```

**Explanation:**
1. The `removeDuplicatesFromSortedList` function takes the head of the sorted linked list as an input parameter.

2. It initializes a pointer `current` to the head of the linked list.

3. The `while` loop runs as long as `current` and `current.next` are not `null`. Inside the loop:

   a. It compares the value of `current` and `current.next`.

   b. If the values are the same (indicating a duplicate), it updates the `next` pointer of `current` to skip the duplicate node and directly point to the next distinct node (`current.next = current.next.next`).

   c. If the values are different, it moves `current` to the next node (`current = current.next`).

4. The loop continues until `current` or `current.next` becomes `null`.

5. Finally, the function returns the head of the updated linked list after removing duplicates.

To use this function, you can create a sorted linked list and then call the `removeDuplicatesFromSortedList` function with the head of the linked list. The function will return the head of the linked list with duplicates removed.
