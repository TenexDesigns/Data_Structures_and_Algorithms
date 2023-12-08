problems link ---> https://github.com/roelkers/50-problems




Problem-Solving Techniques in Programming
There are numerous problem-solving techniques used in programming, each with its strengths and weaknesses. Here are some of the most common, along with examples in TypeScript and their best uses:

1. Dynamic Programming:

      What it does: Stores solutions to subproblems to efficiently solve larger problems.
      Example: Calculating Fibonacci numbers.
      TypeScript
      const fibonacci = (n: number): number => {
        if (n <= 1) return n;
        const memo: number[] = new Array(n + 1).fill(-1);
        memo[0] = 0;
        memo[1] = 1;
        for (let i = 2; i <= n; i++) {
          memo[i] = memo[i - 1] + memo[i - 2];
        }
        return memo[n];
      };
      Use code with caution. Learn more
      Best use: When overlapping subproblems exist and the same solution can be reused for multiple calculations.


        
2. Greedy Method:
        
        What it does: Makes locally optimal choices at each step to find a global optimal solution.
        Example: Finding the minimum spanning tree in a graph.

        
        TypeScript
        function findMinSpanningTree(graph: any): any {
          const vertices = Object.keys(graph);
          const edges: any[] = [];
          for (const vertex of vertices) {
            for (const neighbor of graph[vertex]) {
              edges.push({
                from: vertex,
                to: neighbor,
                weight: graph[vertex][neighbor],
              });
            }
          }

          edges.sort((a: any, b: any) => a.weight - b.weight);
          const mst: any = {};
          for (const edge of edges) {
            if (!mst[edge.from] || !mst[edge.to]) {
              mst[edge.from] = true;
              mst[edge.to] = true;
              if (vertices.length === Object.keys(mst).length) {
                break;
              }
            }
          }
          return mst;
        }


        Use code with caution. Learn more
        Best use: When a greedy approach can guarantee an optimal solution or when finding an approximate solution quickly is important.

          
3. Branch and Bound:

          What it does: Systematically explores all possible solutions, pruning branches that cannot lead to an optimal solution.
          Example: Solving the knapsack problem.
          TypeScript
          function knapsack(capacity: number, weights: number[], values: number[]): number {
            const memo: number[][] = new Array(weights.length + 1).fill(0).map(() => new Array(capacity + 1).fill(0));
            for (let i = 1; i <= weights.length; i++) {
              for (let w = 1; w <= capacity; w++) {
                if (weights[i - 1] > w) {
                  memo[i][w] = memo[i - 1][w];
                } else {
                  memo[i][w] = Math.max(
                    memo[i - 1][w],
                    values[i - 1] + memo[i - 1][w - weights[i - 1]]
                  );
                }
              }
            }
            return memo[weights.length][capacity];
          }
          Use code with caution. Learn more
          Best use: When finding the optimal solution is crucial and the state space is relatively small.


            
4. Recursion:
        
        What it does: A function calls itself with smaller inputs until a base case is reached.
        Example: Factorial calculation.
        TypeScript
        function factorial(n: number): number {
          if (n === 0) return 1;
          return n * factorial(n - 1);
        }
        Use code with caution. Learn more
        Best use: When the problem can be naturally broken down into subproblems that are similar to the original problem.


          
5. Iteration:

        What it does: Solves a problem by repeating a set of instructions until a stopping condition is met.
        Example: Printing Fibonacci numbers.
        TypeScript
        function printFibonacci(n: number): void {
          let a = 0;
          let b = 1;
          for (let i = 0; i < n; i++) {
            console.log(a);
            const temp = a;
            a = b;
            b = temp + b;
          }
        }
        Use code with caution. Learn more
        Best use: When a more iterative approach is easier to implement or more efficient for large




        Other Programming Problem-Solving Techniques:
        Besides the previously mentioned techniques, several others are popular in programming:


        
1. Divide and Conquer:

          What it does: Divides the problem into smaller, independent subproblems, solves them recursively, and combines the solutions.
          Example: Merge sort algorithm.
          TypeScript
          function
           
          mergeSort(array: number[]): number[] {
            if (array.length <= 1) return array;
            const mid = Math.floor(array.length / 2);
            const left = mergeSort(array.slice(0, mid));
          
            
          const right = mergeSort(array.slice(mid));
            return merge(left, right);
          }
          
          function
           
          merge(left: number[], right: number[]): number[] {
            const result: number[] = [];
            let i = 0;
            let
           
          j = 0;
            while (i < left.length && j < right.length) {
              if (left[i] < right[j]) {
                result.push(left[i]);
                i++;
              } else {
                result.push(right[j]);
                j++;
              }
            }
            return [...result, ...left.slice(i), ...right.slice(j)];
          }
          Use code with caution. Learn more
          Best use: When the problem can be efficiently divided into independent subproblems.


            
2. Backtracking:
          
          What it does: Systematically explores all possible solutions to a problem, backtracking when a dead end is reached.
          Example: Solving Sudoku puzzles.
        
          function solveSudoku(board: number[][]): boolean {
            for (let row = 0; row < 9; row++) {
              for (let col = 0; col < 9; col++) {
                if (board[row][col] === 0) {
                  for (let num = 1; num <= 9; num++) {
                    if (isValidPlacement(board, row, col, num)) {
                      board[row][col] = num;
                      if (solveSudoku(board)) {
                        return true;
                      } else {
                        board[row][col] = 0; // backtracking
                      }
                    }
                  }
                  return false; // no valid placement found
                }
              }
            }
            return true; // solved
          }
          
          function isValidPlacement(board: number[][], row: number, col: number, num: number): boolean {
            // check row, column, and 3x3 subgrid for conflicts
          }
          Use code with caution. Learn more
          Best use: When finding all possible solutions is required.




            
3. Memoization:

          What it does: Stores the results of function calls to avoid redundant calculations.
          Example: Fibonacci with memoization.
          
          const memo: Record<number, number> = {};
          
          function fibonacciMemo(n: number): number {
            if (n in memo) return memo[n];
            if (n <= 1) return n;
            memo[n] = fibonacciMemo(n - 1) + fibonacciMemo(n - 2);
            return memo[n];
          }
          Use code with caution. Learn more
          Best use: When functions have expensive calculations and many repeated calls with the same arguments.


            
4. Local search:
        
        What it does: Starts with a solution and iteratively improves it by making small changes.
        Example: Hill climbing algorithm for optimization problems.
        TypeScript
        function hillClimbing(start: any, neighbors: any, evaluate: any): any {
          let current = start;
          let next = neighbors(current);
          while (evaluate(next) > evaluate(current)) {
            current = next;
            next = neighbors(current);
          }
          return current;
        }
        Use code with caution. Learn more
        Best use: When finding an optimal solution may be time-consuming, and a good approximation is sufficient.
        These are just a few examples of various problem-solving techniques used in programming. Choosing the right technique depends on the specific problem and its characteristics.

Sources
github.com/supercoder123/typescript-data-structures-and-algorithms
github.com/mjshuff23/data-structures-algorithms
github.com/roelkers/50-problemssubject to licence (MIT)
github.com/QamT/Ds-and-Algos


  








  
