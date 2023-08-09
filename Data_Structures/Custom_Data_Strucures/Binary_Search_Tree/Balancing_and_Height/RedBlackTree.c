## Red-Black Trees

Red-Black Trees are a type of self-balancing binary search tree where every node has a color attribute, either red or black. The balancing of the tree is maintained by applying a set of rules, called red-black properties:


               NULL and  LEAF nodes
------------------------------------------------------
Note- leaf - Is a node that is null in red-blck tree
    - Node - Is a node that have a value tree
    - Null nodes are not considered children of other nodes in the Red-Black Tree.
    - When calculating black height or determining descendant leaf nodes, you exclude null nodes and consider only the actual nodes in the tree with values.
    - Null nodes . They are used to simplify the structure and handling of the tree but are not part of the trees logical hierarchy.
    - Null nodes are typically introduced to serve as placeholders for real nodes and help ensure that every path in the tree has the same number of black nodes, which is crucial for maintaining the balanced properties of the Red-Black Tree.
    - The black height and the concept of descendant leaf nodes refer to the actual nodes in the tree that have values, excluding null nodes.
    - Null nodes (sentinel nodes) are not typically considered children of other nodes; they are used to simplify tree operations.
  
           BLACK NODES
------------------------------------------------------
    - A black node can have black or red children, and the number of children can vary (0, 1, or 2).
    - The specific colors of children for a black node do not have strict conditions; they can be black or red without violating any Red-Black Tree properties.
    - A black node in a Red-Black Tree can have either black or red children. There are no specific restrictions on the colors of the children of a black node.
    - A black node can have black or red children.


          RED NODES
------------------------------------------------------
    - A red node must have two black children.
    - A red node must have two black children.The children can be null or have values but their color is black
    - If a node is red, then both its children are black.
    - In a Red-Black Tree, a red node must have two black children. This property ensures that no two red nodes are adjacent along any path from the root to a leaf.
  



Reules  for every red black tree.

1. Every node is either red or black.
2. The root is black.
3. All leaves (null or NIL nodes) are black.
4. If a node is red, then both its children are black.
5. Every path from a node to its (Nil or NULL) descendant leaves contains the same number of black nodes [Source 1](https://en.wikipedia.org/wiki/Red%E2%80%93black_tree), [Source 3](https://www.geeksforgeeks.org/introduction-to-red-black-tree/).

e.g The coloring of this willb
     8
    / \
   5   15
  / \  / \ 
 n  n 12  19    
     / \   / \
    9  13 n  23
   / \ /\    / \       
   n n n n  n   n


Red-Blck Tree of the above

      8 (Black)
    /     \
   5(Black)  15(Red)
  / \     /       \ 
 n   n   12(Black) 19(Black)
         / \          /   \
      9(Red) 13(Red) n   23(Red)
     /  \   / \           / \
    n   n  n   n         n   n


The Null nodes are all Black









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
