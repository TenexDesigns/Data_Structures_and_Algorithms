


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




          
