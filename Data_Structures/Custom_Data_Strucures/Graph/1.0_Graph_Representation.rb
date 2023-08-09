Graph representation

Graph can be represented in code using two ways
1.Adjacency matrix
2.Adjacency List (Recommended)



Adjaceny Matrix
---------------------------------------------------------------------------------------------------------------------------------------------------
  
An adjacency matrix is a 2D array of size V * V, where V is the number of vertices in the  graph

Each row and column represesnt a vertex

If the value of any elemnt say, matrix[i][j] is 1, it represents that there is an edges connecting vertex i and vertes j


A ------------B
|
|                                   // This is an undirected graph
|
|
C

Adjacenymatrix=[
  // A B C 
    [0,1,0],
    [1,0,1],
    [0,1,0]
]


console.log(Adjacenymatrci[0][2])   -- > Prints 0 since there is no connectio bewttwn C and A
console.log(Adjacenymatrci[0][1])   -- > Prints 1 since there is a connectio bewttwn A and B
console.log(Adjacenymatrci[1][2])   -- > Prints 1 since there is a connectio bewttwn B and C 
console.log(Adjacenymatrci[0][0])   -- > Prints 0 since A does not contain a self loop









Adjaceny List
---------------------------------------------------------------------------------------------------------------------------------------------------

    Vertices are stored in a map like dat strucure and evevry vertex stores a list of its ajacent vertces 



Adjacey List representation

                  B ------------  C
                  |
                  |                                   
                  |
                  |
                  A


A ------> B
B ------> A,C
C ------> B


AdjacenyList = [
  'A':['B']
  'B':['A','C']                           
  'C':['B']
]


'B': ['A','C'] ---> This is a set that is used to hold the verticesl or nodes adjacebnt or connect to a particlar vertex or node  

Adjacency Matrix Vs Adjacency List

  With an adjacency list, we only need to store the values for the edges that exist.
      With ana djacny matrxi , you stre values irrespective of whether an edge exists or  not. Storage wise , an adjaceny list is wayy more efficient.

    With ajacency list, inserting and finding adjacent nodes is constant time complexity , where as with adjacency where as  with adjacency matrix , its linear Time complexity

    An adjacency list  allows you to store addinitional values  with an edge such as weight of the edge . with adjacny matrix, such information would have to be stored externaly







class Graph{

    constructor(){
        this.adjacencyList =new Map()
        
     }

     

     addVertex(vertex){
        if(!this.adjacencyList.has(vertex)){
            this.adjacencyList.set(vertex,new Set())
        }
     }

     addEdge(vertex1,vertex2){
        if(!this.adjacencyList.has(vertex1)){
            this.addVertex(vertex1)
        }
        if(!this.adjacencyList.has(vertex2)){
            this.addVertex(vertex2)
        }

        this.adjacencyList.get(vertex1).add(vertex2)
        this.adjacencyList.get(vertex2).add(vertex1)
     }

     hasEdge(vertex1,vertex2){
        if(!this.adjacencyList.get(vertex1) || !this.adjacencyList.get(vertex1)){
            return "This vertex is not available"

        }
        else{
            return(
                this.adjacencyList.get(vertex1).has(vertex2)&&
                this.adjacencyList.get(vertex2).has(vertex1)
            )

        }
       

     }



     display(){

     console.log(this.adjacencyList)
       
     }

     removeEdge(vertex1,vertex2){
        this.adjacencyList.get(vertex1).delete(vertex2)
        this.adjacencyList.get(vertex2).delete(vertex1)

     }

     removeVertex(vertex){
        if(!this.adjacencyList.get(vertex)){
            return "Vetex is not there"
        }
        for (let conectedvertex of this.adjacencyList.get(vertex)){
            this.removeEdge(vertex,conectedvertex)

        }

        this.adjacencyList.delete(vertex)

     }
}

const graph = new Graph()

graph.addVertex("A")
graph.addVertex("B")
graph.addVertex("C")


graph.addEdge("A","B")
graph.addEdge("B","C")

graph.display() 

console.log(graph.hasEdge('A','C'))

graph.removeEdge('A','B')


graph.display()


PRINTS THE FOLLWING
----------------------------------------------
Map(3) {
  'A' => Set(1) { 'B' },
  'B' => Set(2) { 'A', 'C' },
  'C' => Set(1) { 'B' }
}
false
Map(3) {
  'A' => Set(0) {},
  'B' => Set(1) { 'C' },
  'C' => Set(1) { 'B' }
}


























  

