Graph representation

Graph can be represented in code using two ways
1.Adjacency matrix
2.Adjacency List



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

                  A ------------B
                  |
                  |                                   
                  |
                  |
                  C


A ------> B
B ------> A,C
C ------> B


AdjacenyList = {
  'A':['B']
  'B':['A','C']
  'C':['B']
}




Adjacency Matrix Vs Adjacency List

  With an adjacency list, we only need to store the values for the edges that exist.
      With ana djacny matrxi , you stre values irrespective of whether an edge exists or  not. Storage wise , an adjaceny list is wayy more efficient.

    With ajacency list, inserting and finding adjacent nodes is constant time complexity , where as with adjacency where as  with adjacency matrix , its linear Time complexity

    An adjacency list  allows you to store addinitional values  with an edge such as weight of the edge . with adjacny matrix, such information would have to be stored externaly
















































  

