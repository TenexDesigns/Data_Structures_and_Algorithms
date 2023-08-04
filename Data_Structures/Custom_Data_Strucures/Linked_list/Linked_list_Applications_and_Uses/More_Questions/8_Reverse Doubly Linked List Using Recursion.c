To reverse a doubly linked list using recursion in JavaScript, you can follow these steps:

**Step 1: Define a Node Class**
First, define a `Node` class to represent each node in the doubly linked list. Each node will have a `data` field to store the value and `prev` and `next` fields to point to the previous and next nodes, respectively.

```javascript
class Node {
    constructor(val) {
        this.data = val;
        this.prev = null;
        this.next = null;
    }
}
```

**Step 2: Implement the Reverse Function**
Next, implement the recursive function `reverse(node)` that will reverse the doubly linked list. The function will take the current node as an argument and return the new head of the reversed list.

```javascript
function reverse(node) {
    if (!node) {
        // Base case: If the node is null, return null
        return null;
    }

    // Swap next and prev for the current node
    var temp = node.next;
    node.next = node.prev;
    node.prev = temp;

    // If this is the end of the list, return this node as the new head
    if (!node.prev) {
        return node;
    }

    // Otherwise, keep going with the previous node in the recursion
    return reverse(node.prev);
}
```

**Step 3: Usage**
Now, you can use the `Node` class and the `reverse` function to create and reverse a doubly linked list.

```javascript
// Create a doubly linked list: 1 <-> 2 <-> 3 <-> 4 <-> 5
var node1 = new Node(1);
var node2 = new Node(2);
var node3 = new Node(3);
var node4 = new Node(4);
var node5 = new Node(5);

node1.next = node2;
node2.prev = node1;
node2.next = node3;
node3.prev = node2;
node3.next = node4;
node4.prev = node3;
node4.next = node5;
node5.prev = node4;

// Print the original list
console.log("Original List:");
var current = node1;
while (current) {
    console.log(current.data);
    current = current.next;
}

// Reverse the list using recursion
var reversedHead = reverse(node1);

// Print the reversed list
console.log("Reversed List:");
current = reversedHead;
while (current) {
    console.log(current.data);
    current = current.next;
}
```

**Explanation:**
1. The `Node` class is defined to represent each node in the doubly linked list. It has a `data` field to store the value and `prev` and `next` fields to point to the previous and next nodes, respectively.

2. The `reverse` function is a recursive function that takes a node as an argument and reverses the doubly linked list starting from that node. The function swaps the `prev` and `next` pointers of each node in the list, effectively reversing the links between nodes.

3. The base case of the recursion is when the `node` is null (i.e., we have reached the end of the list). In this case, the function returns null.

4. During the recursive calls, the function swaps the `prev` and `next` pointers of the current node. Then, it makes a recursive call with the previous node (`node.prev`) to reverse the rest of the list.

5. The function keeps making recursive calls until it reaches the end of the list (i.e., the first node, where `node.prev` is null). At this point, the function returns the first node as the new head of the reversed list.

6. After the `reverse` function is executed, the doubly linked list will be reversed, and you can traverse it from the new head to the end to see the reversed order of elements.

Recursion in this context involves multiple function calls, each with its own set of local variables, forming a call stack. The order of execution is as follows:

1. The initial call to `reverse(node1)` is made with the head node `node1`.

2. The function enters the recursive calls, starting with `reverse(node4)`. It swaps the `prev` and `next` pointers for `node4` and makes a recursive call with `node4.prev` (which is `node3`).

3. The recursion continues with `reverse(node3)`, `reverse(node2)`, and finally `reverse(node1)`.

4. When the recursion reaches the base case (`node.prev` is null), the function starts unwinding. It returns the new head of the reversed list (`node5`) to the previous call (`node4`). Then, `node4` returns the new head to `node3`, and so on.

5. The recursion continues to unwind until the initial call to `reverse(node1)` receives the new head of the reversed list (`node5`).

The call stack forms a stack-like structure where each function call is pushed onto the stack, and when a function returns, it's popped from the stack. This way, the recursion efficiently reverses the doubly linked list in a bottom-up manner.
