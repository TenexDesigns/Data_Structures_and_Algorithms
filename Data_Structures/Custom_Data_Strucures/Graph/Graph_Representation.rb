Graph representation

Graph can be represented in code using two ways
1.Adjacency matrix
2.Adjacency List



Adjaceny Matrix

An adjacency matrix is a 2D array of size V * V, where V is the number of vertices in the  graph

Each row and column represesnt a vertex

If the value of any elemnt say, matrix[i][j] is 1, it represents that there is an edges connecting vertex i and vertes j


A ------------B
|
|                                   // This is an undirected graph
|
|
C

matrix=[
  // A B C 
    [0,1,0],
    [1,0,1],
    [0,1,0]
]


console.log(matrci[0][2])   -- > Prints 0 since there is no connectio bewttwn C and A
console.log(matrci[0][1])   -- > Prints 1 since there is a connectio bewttwn A and B
console.log(matrci[1][2])   -- > Prints 1 since there is a connectio bewttwn B and C 
console.log(matrci[0][0])   -- > Prints 0 since A does not contain a self loop

