class Node{
    constructor(value){
        this.value = value
        this.left = null
        this.right = null

    }
}


class BinarSearchTree{

    constructor(){
        this.root = null

    }

    isEmpty(){
        return this.root === null
    }

    insert(value){
        const newNode = new Node(value)

        if(this.isEmpty()){
            this.root = newNode
        }else{
            this.insertNode(this.root,newNode)
        }
        
        
    }

    insertNode(root,newNode){

        
        if(newNode.value < root.value){
            if(root.left === null){
                root.left = newNode
            }else{
                this.insertNode(root.left, newNode)
            }
        }else{
            if(root.right === null){
                root.right = newNode
            }else{
                this.insertNode(root.right, newNode)
            }

             
        }


    }

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


    search(root,value)
    {
        if(!root){
            return false
        }else
        {
            if(value === root.value)
            {
                return true
            }else if( value < root.value) 
            {
               return this.search(root.left,value)               
            }
            else if(value > root.value){
                return this.search(root.right, value)
            }
        }

    }

    preorder(root){

        if(root){
            console.log(root.value)

            this.preorder(root.left)
            this.preorder(root.right)
        }
    }

    inorder(root){
        if(root){
            this.inorder(root.left)
            console.log(root.value)
            this.inorder(root.right)
        }
    }

    postorder(root){

        if(root){
            this.postorder(root.left)
            this.postorder(root.right)
            console.log(root.value)


        }

    }


    insert(value){
        const newNode2 = new Node(value)


        if(this.isEmpty()){ 
          this.root = newNode2
        }
        else
        {
          this.insertNewNode(this.root,newNode2)
        }
    }

    insertNewNode(root,node){

        if(node.value < root.value){
            if(root.left === null){
                root.left = node
            }else{
                this.insertNewNode(root.left,node)
            }
        }else{
            if(root.right === null){
                root.right = node
            }else{
                this.insertNewNode(root.right,node)
            }

        }

    }





}
        
        
        
        
        
        
        
        
        
         
        





const bst = new BinarSearchTree()
bst.insert(10)
bst.insert(7)
bst.insert(15)
bst.insert(5)
bst.insert(9)
bst.insert(12)
bst.insert(20)
bst.insert(3)
bst.insert(8)
bst.insert(19)
bst.insert(22)
 

console.log(bst.search(bst.root,40))
console.log(bst.search(bst.root,10))
console.log(bst.search(bst.root,5))
console.log(bst.search(bst.root,15))
console.log(bst.search(bst.root,20))
console.log(bst.search(bst.root,60))



bst.levelorder()




          The code you provided is a JavaScript implementation of a Binary Search Tree (BST). A BST is a tree data structure in which each node has at most two children, referred to as the left child and the right child. For each node, all elements in the left subtree are less than the node, and all elements in the right subtree are greater than the node.

Heres a breakdown of the methods in your code:

isEmpty(): This method checks if the tree is empty by checking if the root is null.
insert(value): This method creates a new node with the given value and inserts it into the tree. If the tree is empty, it sets the new node as the root. Otherwise, it calls the insertNode method to find the correct place for the new node.
insertNode(root, newNode): This is a helper method for the insert method. Its a recursive function that compares the new nodes value with the current nodes value and decides to go left or right.
search(root, value): This method checks if a value exists in the tree. It starts at the given root and compares the value to the roots value. If the value is less, it goes left. If the value is greater, it goes right. If it finds the value, it returns true. If it reaches a null node (meaning the value isn't in the tree), it returns false.
preorder(root), inorder(root), and postorder(root): These methods are different ways to traverse the tree, known as depth-first search. In a preorder traversal, the current node is visited first, then the left subtree, and finally the right subtree. In an inorder traversal, the left subtree is visited first, then the current node, and finally the right subtree. In a postorder traversal, the left subtree is visited first, then the right subtree, and finally the current node.
The last part of the code creates a new BST, inserts some values, and then performs some searches and a postorder traversal.

Here's an example of how the preorder method works:

preorder(root) {
    if (root) {
        console.log(root.value); // Visit the root first
        this.preorder(root.left); // Then traverse the left subtree
        this.preorder(root.right); // Finally, traverse the right subtree
    }
}
When you call bst.preorder(bst.root), it will print out the values of the nodes in the order they are visited in a preorder traversal. For your tree, the output would be: 10, 7, 5, 3, 9, 8, 15, 12, 20, 19, 22.






--------------------------------

    


































    
