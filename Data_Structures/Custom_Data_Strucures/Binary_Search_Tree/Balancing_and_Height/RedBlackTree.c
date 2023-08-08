## Red-Black Trees

Red-Black Trees are a type of self-balancing binary search tree where every node has a color attribute, either red or black. The balancing of the tree is maintained by applying a set of rules, called red-black properties:

1. Every node is either red or black.
2. The root is black.
3. All leaves (null or NIL nodes) are black.
4. If a node is red, then both its children are black.
5. Every path from a node to its descendant leaves contains the same number of black nodes [Source 1](https://en.wikipedia.org/wiki/Red%E2%80%93black_tree), [Source 3](https://www.geeksforgeeks.org/introduction-to-red-black-tree/).

Here is an example of a Red-Black tree in JavaScript:

```javascript
class Node {
  constructor(data, color, left = null, right = null) {
    this.data = data;
    this.color = color;
    this.left = left;
    this.right = right;
  }
}

class RedBlackTree {
  constructor() {
    this.NIL = new Node(null, 'black');
    this.root = this.NIL;
  }

  // Preorder
  preOrderHelper(node) {
    if (node !== this.NIL) {
      console.log(node.data);
      this.preOrderHelper(node.left);
      this.preOrderHelper(node.right);
    }
  }

  // Inorder
  inOrderHelper(node) {
    if (node !== this.NIL) {
      this.inOrderHelper(node.left);
      console.log(node.data);
      this.inOrderHelper(node.right);
    }
  }

  // Post order
  postOrderHelper(node) {
    if (node !== this.NIL) {
      this.postOrderHelper(node.left);
      this.postOrderHelper(node.right);
      console.log(node.data);
    }
  }

  // Balance the tree after deletion of a node
  fixDelete(node) {
    let sibling;
    while (node !== this.root && node.color === 'black') {
      if (node === node.parent.left) {
        sibling = node.parent.right;
        if (sibling.color === 'red') {
          sibling.color = 'black';
          node.parent.color = 'red';
          this.leftRotate(node.parent);
          sibling = node.parent.right;
        }

        if (sibling.left.color === 'black' && sibling.right.color === 'black') {
          sibling.color = 'red';
          node = node.parent;
        } else {
          if (sibling.right.color === 'black') {
            sibling.left.color = 'black';
            sibling.color = 'red';
            this.rightRotate(sibling);
            sibling = node.parent.right;
          } 

          sibling.color = node.parent.color;
          node.parent.color = 'black';
          sibling.right.color = 'black';
          this.leftRotate(node.parent);
          node = this.root;
        }
      } else {
        // TODO: Add the case for right child
      }
    }
    node.color = 'black';
  }

  // Balance the tree after insertion of a node
  fixInsert(node) {
    let uncle;
    while (node.parent.color === 'red') {
      if (node.parent === node.parent.parent.right) {
        uncle = node.parent.parent.left; // uncle
        if (uncle.color === 'red') { // case 3.1
          uncle.color = 'black';
          node.parent.color = 'black';
          node.parent.parent.color = 'red';
          node = node.parent.parent;
        } else {
          if (node === node.parent.left) { // case 3.2.2
            node = node.parent;
            this.rightRotate(node);
          }
          node.parent.color = 'black'; // case 3.2.1
          node.parent.parent.color = 'red';
          this.leftRotate(node.parent.parent);
        }
      } else {
        // TODO: Add the case for left child
      }
      if (node === this.root) {
        break;
      }
    }
    this.root.color = 'black';
  }

  // TODO: Add the methods for leftRotate, rightRotate, insert, delete
}
```

In the code above, a `Node` class is defined to represent each node in the Red-Black tree. The `RedBlackTree` class then defines the methods for pre-order, in-order, and post-order traversal, balancing the tree after insertion and deletion, and placeholders for rotation and insertion methods.

Red-Black Trees are used in many search-based applications where worst-case guarantees are required. They are used in the TreeMap and TreeSet classes in Java, the multimap and multiset classes in C++, and the ordered map and ordered set classes in the GNU C++ Library. They are also used in the Linux kernel, Nginx, etc. The main advantage of Red-Black Trees over AVL trees is that they
