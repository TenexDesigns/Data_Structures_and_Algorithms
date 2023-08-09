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



Note - If a sub tree has no children nodes you put its length as -1. If there is no subtree on either side ,either rigth or left, we give it -1,
     - If a node  has children nodes, you count edges upto the deepest node of that node



So in th above case

Left sub tree = -1
right sub tree  = 2

balanc factor = -1 -(2) = -3









Here are the four basic rotations used for balancing an AVL tree:


1. Right Rotation (RR Rotation):
   - Used when balance factor of a node becomes greater than 1 and the imbalance is in the left subtree of the left child.

2. Left Rotation (LL Rotation):
   - Used when the balance factor of a node becomes greater than 1 and the imbalance is in the left subtree of the left child.
      
3. Left-Right Rotation (LR Rotation):
   - Used when the balance factor of a node becomes greater than 1 and the imbalance is in the right subtree of the left child.
   
4. Right-Left Rotation (RL Rotation):
   - Used when the balance factor of a node becomes less than -1 and the imbalance is in the left subtree of the right child.


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



4. 10,30,20 -(Right-left rotation) balance factor of a node becomes less than -1 and the imbalance is in the left subtree of the right child.  
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


















