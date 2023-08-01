


Breadth First Search (BFS)

Exploares all nodes at the presesnt depth prior to movinf to the nodes at the next depth level

BFS Traversal Approcach


1.Create a queuue
2.Enqueueu the root node
3.As long as a node exists in the queuue
         (a) Deququ the node from the front
         (b) Read the nodes value
         (c) Enqueue the nodes left child if it exists
         (d) Enqueue the nodes right child if it exists



breadthfirstsearch(){
        const quque = []
        quque.push(this.root)

        while(quque.length){
            let curr = quque.shift()
            console.log(curr.value)

            if(curr.left){
                quque.push(curr.left)

            }
            if(curr.right){
                quque.push(curr.right)
            }
        }
    }




          



MORE EXPLANANTION
**************************************************************************************************************
                          
Breadth-First Search (BFS) is a technique for traversing trees or graphs where you visit all the nodes at the current depth (or distance from the root) before visiting the nodes at the next depth level. In a Binary Search Tree (BST), this is also known as level order traversal. BFS uses a queue data structure in its implementation digitalocean.com.

Here is how you can implement BFS in a BST:

class BinarySearchTree {
    //...
    bfs() {
        let result = [];
        let queue = [];

        if (this.root !== null) {
            queue.push(this.root);
            while(queue.length > 0) {
                let current = queue.shift();
                result.push(current.value);

                if (current.left !== null) {
                    queue.push(current.left);
                }

                if (current.right !== null) {
                    queue.push(current.right);
                }
            }
        }

        return result;
    }
    //...
}
In the bfs method, we start by initializing an empty results array and a queue. Then, if the root of the BST is not null, we add it to the queue. We then start a loop that continues as long as there are nodes in the queue.

In each iteration of the loop, we remove the first node from the queue and add its value to the results array. Then, if the current node has a left child, we add it to the end of the queue. Similarly, if the current node has a right child, we add it to the end of the queue. This process continues until all nodes in the BST have been visited.

The bfs method returns the results array, which contains the values of the nodes in the order they were visited.

To optimize BFS and make it more efficient, you can apply several strategies:

Iterative over Recursive: An iterative solution using a queue is generally more efficient than a recursive solution because it avoids the overhead of function call stacks.
Minimize Queue Operations: Minimize the number of enqueue and dequeue operations. Each operation can take up to O(n) time in the worst case, so reducing the number of operations can significantly improve performance.
Space Optimization: If the tree is very large, the queue can also become very large, taking up a lot of memory. You can optimize space by using a pointer to track the current level and only enqueue the next level nodes when necessary.
The time complexity of BFS is O(n), where n is the number of nodes in the BST, as every node needs to be visited once. 
The space complexity is O(w), where w is the maximum width (or number of nodes at a level) of the tree, as thats the maximum number of nodes that can be stored in the queue at any time techiedelight.com.


          



          



          
v
