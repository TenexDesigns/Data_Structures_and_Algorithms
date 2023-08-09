An AVL tree (Adelson-Velsky and Landis tree) is a self-balancing binary search tree. It maintains a balanced structure by ensuring that the heights of the two child subtrees of any node differ by at most one. This balancing helps in maintaining efficient search, insertion, and deletion operations, all of which have a time complexity of O(log n) in an AVL tree.

The balance factor of a node in an AVL tree is the difference between the heights of its left and right subtrees. It can have three possible values: -1, 0, or 1. A balance factor of -1 indicates that the left subtree is one level taller, a balance factor of 1 indicates that the right subtree is one level taller, and a balance factor of 0 indicates that the two subtrees are of the same height.


How to find balance factor  

Balance factor  = leftsub tree - Right sub tree

   A
  / \
 T1  B
    / \
   T2  C
       / \
      T3  T4









                   A
                  / \
          ----------------------------
              T1 |   B
 left-sub-tree   |  / \      Right-sub-tree
                 | T2  C
                 |    / \
                 |   T3  T4


So in th above case

Left sub tree = 0
right sub tree  = 2

balanc factor = 0 -(2) = -3


Note  - If  node has no children ,(it is  leaf node) its height becomes 0 
      - If no node is present, the we put -1
     - If a node  has children nodes, you count edges upto the deepest node of that node and that becomes the heith to be used as eithr lst or rst

               66
              /  \
            55    77
           /                                                                            
          15                   
                             
Left sub tree = 1
right sub tree  = 0

balanc factor = 1 -(0) = 1                  So no balancing needed here
   -------------------------------------------------------------
                             
                             
                                
               66
              /
            55
           /
         15

Left sub tree = 1
right sub tree  = -1

balanc factor = 1 -(1) = 2             there is an imbalance  on the left side of the node 66,we call node 66 a critical node. Here we use left roatatio n
----------------------------------------------------------






Here are the four basic rotations used for balancing an AVL tree:


1. Right Rotation:
   - Used when  balance factor of a node becomes greater than 1 and the imbalance is in the left subtree of the left child. 

2. Left Rotation 
   - Used when the balance factor of a node becomes less than -1 and the imbalance is in the right subtree of the right child..
      
3. Left-Right Rotation (LR Rotation):
   - Used when the balance factor of a node becomes greater than 1 and the imbalance is in the right subtree of the left child. 
   
4. Right-Left Rotation (RL Rotation):
   - Used when balance factor of a node becomes less than -1 and the imbalance is in the left subtree of the right child.

The balance factor affects the direction or choice of rotation. If the balance factor is greater than 1, a left rotation is performed. If the balance factor is less than -1, a right rotation is performed.
The specific rotation (left-right or right-left) depends on the specific imbalance within the tree.



a binary has three elemtts, 10,20,30. This elemts can be inseted in 6 diffreent ways, Four of which we will use to explain th duiffreent rotaions possible in avl trees


1.  30,20,10 -(right rotation) balance factor of a node becomes greater than 1 and the imbalance is in the left subtree of the left child. 
The balance factor is calcurlated as l.s.t - r.s.t   i.e  1- (-1)  =2, 

        
             30                 20
            /        =>        /   \
          20                 10     30         
          /                
        10                    





         -----> the rotation is to the right, thus we call this a RIGT rotation
         |
         ^   30                   20
         |   /        =>        /   \
          20                 10     30         
          /                
        10                    


Left sub tree = 1
right sub tree  = -1

balanc factor = 1 - (-1) = 2




2. 10,20,30-(left rotation) The balance factor of a node becomes less than -1 and the imbalance is in the right subtree of the right child.                                                                           



This rotation is to the left, therfore we call it left rotation


  -<---<--
          |
     10   ^                    20
      \   |     =>            /   \
       20                  10     30         
         \                    
         30                        

      


Left sub tree = -1
right sub tree  = 1

balanc factor = -1 - (1) = -2





3.  30,10,20- (left-right rotation) - Used when the balance factor of a node becomes greater than 1 and the imbalance is in the right subtree of the left child.  
Here you do a left-right rotation,(left rotaion firt) putting 20 in the place of ten  and then (Rifht-rottion second) on resulting tree  
using right rotation


     30
   / 
  10  
    \
     20         



                                                 
                                                  then right rotation
                                                 -->-->-- 
    30                                           |   30                                         20 
   /                                             |  /                                         /    \
  10 -<-<-<-                         =>           20                           =>            10    30
    \    |                                       /            
     20  |  left rotation first                 10           





Left sub tree = 1
right sub tree  = -1

balanc factor = 1 - (-1) = 2



4. 10,30,20 -(Right-left rotation) Used when balance factor of a node becomes less than -1 and the imbalance is in the left subtree of the right child.  
Here you do a right-left rotation, (Right rotation first)putting 20 in the place of 30  and 30 in the place of 20 then (Left-rotation next)do a left rotaion on the  resulting tree  


  10  
    \
     30
    / 
  20          




                              -<--<--                                
         10                   10     |                                20
    -->->- \                     \   |                              /    \
    |      30                     20                    =>         10     30
    |      /                        \                            
        20                           30                             



Left sub tree = -1
right sub tree  = 1

balanc factor = -1 - (1) = -2



5. 20,10 30 - results i balanced avl tree 
6. 20,30,10 - results in balanced tree

5.and 6. Balanced AVL Trees: These two scenarios result in balanced AVL trees directly, so no rotations are needed.




When choosing which rotation to use, the decision depends on the balance factor and the imbalance location. The following conditions apply:

- If the balance factor is greater than 1 and the imbalance is in the left subtree of the left child (LL case), perform a right rotation.
- If the balance factor is less than -1 and the imbalance is in the right subtree of the right child (RR case), perform a left rotation.
- If the balance factor is greater than 1 and the imbalance is in the right subtree of the left child (LR case), perform a left-right rotation.
- If the balance factor is less than -1 and the imbalance is in the left subtree of the right child (RL case), perform a right-left rotation.

In your examples, the balance factor is calculated as "left subtree height - right subtree height" for each node. Depending on the sign and magnitude of the balance factor, you determine the rotation needed.

For larger binary trees, the same principles apply. After insertion or deletion, you need to check the balance factor of each node along the path from the inserted/deleted node to the root and perform the necessary rotations to restore balance.

Heres a JavaScript implementation of an AVL tree with insertions and rotations for the scenarios you mentioned:

```javascript
class TreeNode {
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

    getHeight(node) {
        return node ? node.height : 0;
    }

    getBalanceFactor(node) {
        return node ? this.getHeight(node.left) - this.getHeight(node.right) : 0;
    }

    leftRotate(y) {
        const x = y.right;
        const T2 = x.left;

        x.left = y;
        y.right = T2;

        y.height = Math.max(this.getHeight(y.left), this.getHeight(y.right)) + 1;
        x.height = Math.max(this.getHeight(x.left), this.getHeight(x.right)) + 1;

        return x;
    }

    rightRotate(x) {
        const y = x.left;
        const T2 = y.right;

        y.right = x;
        x.left = T2;

        x.height = Math.max(this.getHeight(x.left), this.getHeight(x.right)) + 1;
        y.height = Math.max(this.getHeight(y.left), this.getHeight(y.right)) + 1;

        return y;
    }

    leftRightRotate(node) {
        node.left = this.leftRotate(node.left);
        return this.rightRotate(node);
    }

    rightLeftRotate(node) {
        node.right = this.rightRotate(node.right);
        return this.leftRotate(node);
    }

    insert(value) {
        this.root = this._insert(this.root, value);
    }

    _insert(node, value) {
        if (!node) {
            return new TreeNode(value);
        }

        if (value < node.value) {
            node.left = this._insert(node.left, value);
        } else if (value > node.value) {
            node.right = this._insert(node.right, value);
        } else {
            return node; // Duplicate values not allowed
        }

        node.height = 1 + Math.max(this.getHeight(node.left), this.getHeight(node.right));

        const balance = this.getBalanceFactor(node);

        // Left Heavy
        if (balance > 1) {
            if (value < node.left.value) {
                return this.rightRotate(node);
            } else {
                return this.leftRightRotate(node);
            }
        }

        // Right Heavy
        if (balance < -1) {
            if (value > node.right.value) {
                return this.leftRotate(node);
            } else {
                return this.rightLeftRotate(node);
            }
        }

        return node;
    }
}

const avlTree = new AVLTree();
const elements = [30, 20, 10];
elements.forEach(element => avlTree.insert(element));
console.log(avlTree.root);
```

This implementation handles the insertion of elements into an AVL tree and performs rotations as needed to maintain balance. It includes left, right, left-right, and right-left rotations.

Remember, AVL trees are just one type of self-balancing binary search tree,










