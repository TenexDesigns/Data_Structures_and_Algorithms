Three Traversal- This is visiting evevry node in the treee

A hierachical data strucure like tree can be traversed in different ways including the fowing


1.Depth First Search (DFS)
2.Breadth First Search(BFS)







Depth First Search (DFS)

The DFS algorithm starts at the root node and exposes as far as possible (to deepest node) along each branch before backtracking

Visit the root node, visit all the nodes in the left subtree and visit all the nodes in the right subtree

Depepning on the order in which we do this, there can be three types of DFS traversals

1. Preorder
2. Inorder
3. Postorder



Pre-Order

1.Read the data of the node
2.Visit the left subtree
3.Visit the right subtree




















     





















In the context of trees, DFS can be implemented using three different traversal methods: Pre-order, In-order, and Post-order. Let's see how these methods work and implement them in JavaScript:

Pre-order Traversal (Root-Left-Right):
In pre-order traversal, the root node is visited first, followed by the left subtree, and then the right subtree.
javascript
Copy code
class Node {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }
}

function preOrderTraversal(node) {
    if (node) {
        console.log(node.value);
        preOrderTraversal(node.left);
        preOrderTraversal(node.right);
    }
}

// Usage:
const root = new Node(1);
root.left = new Node(2);
root.right = new Node(3);
root.left.left = new Node(4);
root.left.right = new Node(5);

console.log("Pre-order traversal:");
preOrderTraversal(root);
In-order Traversal (Left-Root-Right):
In in-order traversal, the left subtree is visited first, followed by the root node, and then the right subtree.
javascript
Copy code
function inOrderTraversal(node) {
    if (node) {
        inOrderTraversal(node.left);
        console.log(node.value);
        inOrderTraversal(node.right);
    }
}

// Usage:
console.log("In-order traversal:");
inOrderTraversal(root);
Post-order Traversal (Left-Right-Root):
In post-order traversal, the left subtree is visited first, then the right subtree, and finally the root node.
javascript
Copy code
function postOrderTraversal(node) {
    if (node) {
        postOrderTraversal(node.left);
        postOrderTraversal(node.right);
        console.log(node.value);
    }
}

// Usage:
console.log("Post-order traversal:");
postOrderTraversal(root);
These three methods help you traverse and explore the tree nodes in different orders, and each of them has its specific use cases. For example, in-order traversal is commonly used to get elements of a BST in sorted order, while pre-order and post-order traversals are used for various tree-related computations and processing.














