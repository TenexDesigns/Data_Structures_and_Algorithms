## AVL Trees

AVL trees, named after its inventors, Adelson-Velsky and Landis, are a type of self-balancing binary search tree. The main concept behind AVL trees is that the height of the left and right subtrees of any node differs by at most one. This property is maintained through a process called rotation which occurs after every insertion or deletion operation. If at any time the difference in heights is more than one, rebalancing is done to restore this property [Source 2](https://www.geeksforgeeks.org/introduction-to-avl-tree/), [Source 4](https://en.wikipedia.org/wiki/AVL_tree), [Source 12](https://www.cs.cornell.edu/courses/cs2112/2021fa/lectures/avl/).

Let's consider an example of AVL tree in JavaScript:

```javascript
class Node {
  constructor(data, left = null, right = null) {
    this.data = data;
    this.left = left;
    this.right = right;
    this.height = 1; // height of node
  }
}

class AVLTree {
  constructor(root = null) {
    this.root = root;
  }

  // function to insert a node
  insert(data) {
    let node = new Node(data);
    if (!this.root) {
      this.root = node;
    } else {
      let current = this.root;
      let parent;
  
      while (current) {
        parent = current;
        if (node.data < current.data) {
          current = current.left;
        } else {
          current = current.right;
        }
      }
  
      if (node.data < parent.data) {
        parent.left = node;
      } else {
        parent.right = node;
      }
    }
    this.root = this.balanceTree(this.root);
  }

  // function to balance tree
  balanceTree(node) {
    // update height of the current node
    this.updateHeight(node);

    // balance factor
    let balanceFactor = this.getBalanceFactor(node);

    if (balanceFactor > 1) {
      if (this.getBalanceFactor(node.left) > 0) {
        // left left case
        node = this.rotateRight(node);
      } else {
        // left right case
        node.left = this.rotateLeft(node.left);
        node = this.rotateRight(node);
      }
    } else if (balanceFactor < -1) {
      if (this.getBalanceFactor(node.right) < 0) {
        // right right case
        node = this.rotateLeft(node);
      } else {
        // right left case
        node.right = this.rotateRight(node.right);
        node = this.rotateLeft(node);
      }
    }
    return node;
  }

  // function to perform left rotation
  rotateLeft(node) {
    let newRoot = node.right;
    node.right = newRoot.left;
    newRoot.left = node;
    this.updateHeight(node);
    this.updateHeight(newRoot);
    return newRoot;
  }

  // function to perform right rotation
  rotateRight(node) {
    let newRoot = node.left;
    node.left = newRoot.right;
    newRoot.right = node;
    this.updateHeight(node);
    this.updateHeight(newRoot);
    return newRoot;
  }

  // update the height of the node
  updateHeight(node) {
    if (node) {
      let leftHeight = (node.left === null) ? -1 : node.left.height;
      let rightHeight = (node.right === null) ? -1 : node.right.height;
      node.height = Math.max(leftHeight, rightHeight) + 1;
    }
  }

  // get balance factor of the node
  getBalanceFactor(node) {
    let leftHeight = (node.left === null) ? -1 : node.left.height;
    let rightHeight = (node.right === null) ? -1 : node.right.height;
    return leftHeight - rightHeight;
  }
}
```

In the code above, a `Node` class is first defined to represent each node in the AVL tree. The `AVLTree` class then defines the methods for inserting a node, balancing the tree, performing left and right rotations, updating the height of a node, and getting the balance factor of a node.

AVL trees are a good choice when frequent lookups are required, as they are more strictly balanced and thus provide faster lookups compared to some other self-balancing trees. However, they can be slower for insertions and deletions, as they may require more rotations to maintain balance [Source 4](https://en.wikipedia.org/wiki/AVL_tree), [Source 5](https://www.geeksforgeeks.org/balanced-binary-tree/).







MORE EXPLAANNTION
********************************************************************************************************************************************

















