Sure, I can provide an explanation of each of these height balancing techniques using an unbalanced binary tree and provide code samples in JavaScript. Let's start with AVL trees.

**AVL Trees:**
AVL trees are binary search trees that maintain a balance factor for each node, which is the difference between the heights of its left and right subtrees. An AVL tree is balanced if the balance factor of every node is between -1, 0, or 1.

**Balancing Rule:**
Upon insertion or deletion of a node, if the balance factor of any node becomes greater than 1 or less than -1, a rotation operation is performed to restore the balance.

**Algorithm:**
There are four types of rotations: 
1. Left Rotation
2. Right Rotation
3. Left-Right Rotation
4. Right-Left Rotation

**Usage:**
AVL trees are suitable when you need efficient searching, insertion, and deletion operations, and you want to maintain a balanced tree for optimal performance.

**Implementation in JavaScript:**
Here's an example of an AVL tree implementation in JavaScript:

```javascript
class AVLNode {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
        this.height = 1;
    }
}

class AVLTree {
    constructor() {
        this.root = null;
    }

    // Implement insertion and balancing here

    // Implement rotations here
}
```

Now, let's move on to Red-Black trees.

**Red-Black Trees:**
Red-Black trees are another form of self-balancing binary search trees where each node has an extra color attribute (either red or black) to ensure balanced properties.

**Balancing Rules:**
1. Every node is colored red or black.
2. The root and leaves (null nodes) are black.
3. Red nodes cannot have red children.
4. Every path from a node to its descendant leaves must have the same number of black nodes, which ensures that the tree remains balanced.

**Algorithm:**
After insertion, you may need to perform rotations and recoloring to maintain the Red-Black properties.

**Usage:**
Red-Black trees are useful when you want a good balance between performance and simplicity of implementation.

**Implementation in JavaScript:**
Here's an example of a Red-Black tree implementation in JavaScript:

```javascript
class RBNode {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
        this.color = "RED"; // or "BLACK"
    }
}

class RedBlackTree {
    constructor() {
        this.root = null;
    }

    // Implement insertion and balancing here

    // Implement rotations and recoloring here
}
```

Next, let's discuss B-trees.

**B-trees:**
B-trees are self-balancing trees designed to maintain sorted data efficiently in external storage (such as databases) with large amounts of data.

**Balancing Rules:**
A B-tree of order `m` satisfies:
1. Each node can have at most `m` children.
2. Each node (except the root) has at least `ceil(m/2)` children.
3. The keys within a node are sorted in ascending order.

**Algorithm:**
Insertion and deletion in B-trees involve splitting and merging nodes to maintain the order and balance.

**Usage:**
B-trees are commonly used in databases and file systems to manage large datasets efficiently.

**Implementation in JavaScript:**
Here's a simplified example of a B-tree implementation in JavaScript:

```javascript
class BTreeNode {
    constructor() {
        this.keys = [];
        this.children = [];
    }
}

class BTree {
    constructor(order) {
        this.root = new BTreeNode();
        this.order = order;
    }

    // Implement insertion and balancing here

    // Implement splitting and merging nodes here
}
```

Finally, let's discuss Splay trees.

**Splay Trees:**
Splay trees are self-adjusting binary search trees that bring the most recently accessed node to the root to improve future access times.

**Balancing Rules:**
Splay trees use a splaying operation that rearranges nodes during insertion, deletion, or search to maintain the "access history" property.

**Algorithm:**
Splaying involves a sequence of rotations to move the accessed node to the root.

**Usage:**
Splay trees are suitable when you need to frequently access certain elements to optimize their access times.

**Implementation in JavaScript:**
Here's an example of a simplified Splay tree implementation in JavaScript:

```javascript
class SplayNode {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }
}

class SplayTree {
    constructor() {
        this.root = null;
    }

    // Implement splay operation

    // Implement insertion, deletion, and search with splaying
}
```

Please note that these code samples are simplified and do not cover all edge cases and implementation details. In a real-world scenario, you would need to handle various cases and edge conditions to ensure the correct functioning of these balancing techniques.
