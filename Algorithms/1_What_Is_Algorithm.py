

Algorthim
Masure performance of algorithm
Time and Space complecity
Big O notation

Types of Algorthims
 - Math algorithms
 - Sort algoritms
 - Search algorithms
 - Misc . algorthims and problem solving algortims



1. WHat is an algorithm
- An algorithm is a set of well defined instructions to solve a particular problem

input --> Algoritm --> Output

e.g Algoritm to add two numbers

input a,b   algorthm       output
            add a +b       addition of a and b
            return sum



CHARACTERISTIC OF ALGORITMS

- Have well defined inputs and outputs
- Each step should be clear and unambiguous
- Language independed



Why Leran Algorthms

As a developer , you are going to come across problems that you need to solve

Learning algorithms translates to learning different techniques to efficently solve these problems

One problem can be solved in many ways using different algoritms

 Every algoritmn comes with its owm tradeoffs when it comes to performnce 

There are multiple ways to solve one problem

e.g There are multiple algorithms to sort a list of numbers

How do we analize which one of them is the most efficent algoritm


HOW DO WE MEASURE THE PERFORMANCE OF AN ALGORITM

Algortim analis

The absolute running time of an algoritm can  not be predicted , since it depends on a number of factors

- Progrming language used to implement the algoritm

- The computer the program runns on

-Other programs running at the same time

- Quality of the operating system





PERFORMACE

We evaluate the performance of an algorithm in terms of its input sixe.
   An what the imput size does to the algoetim in terms of  time complexity and space complexity

Time complexity - Amount of time taken by an algoritm to run, as a function of input size
Space complexity - Amount of memory taken by an algoritm to run, as a function of input size



By eveluateing performance of an algortm against the input size, the analis is not only machine independet , but the comparison is also more approprite

Remeber , ther is no one solution that works every single time. It is always good to know multiple ways to solve the problem and use the best solution, given your constraints.


  If your app need to be very quick and has plenty of memeory to work with, you dont have to worry about spac complexity

If you have very little memeory to work with, you should pick a soulution that is reltively slower but need less space














HOW DO WE REPRENT THE TIME AND SPCE COLPLEXITY OF AN ALGORTHM
We  represnt space and time complexity of an algorithm using ASMPTONIC OTATIONS

ASYMPTONIC NOTATIONS - These are mathematical tools to represnent time and space complexity.

ASYMPTIONC NOTATIONS ARE OF THREE TYPES
-Big - O notation (O-notation) - WOrst case complexity
-Omega Noation (^-Notataion) - Best case complexity
-Theta noataion (o-Noatation) - Average case complexity


We wil prialy focus on Big-O complexity or worst case complexity since that i what is mmostly asked 








BIG - NOTATIONS
Represents the worst case complexity of an algorthm 
Big -O notation describes the complexity of an algorithm using algebraic terms

Big-O notation has two important characteristics
 - It is expressed in terms of input
- It foces on the bigger picture without getting caught up in the minute details

We will first to undertsand this on the time complexity side, then later on expand it on the space complexity side




Time complexity 
We can not calculate the absolute time an algortm takes to excute hence that can not be the time complexity
Insted we count the number of times a statement excutes based on input size


e.g

-------The algortu
function sumamtion (n){
 let sum = 0
 for(let i =1; i<=n; i++){
  sum +=i
 }   
return sum
}



e.g sumamtion(4) = 10
1+2+3+4= 10



-------------------------------------
 oUr algorthim here below has there lines to excute

let sum =0
sum +=i
return sum;




The algorthim summation(4)


let sum =0   -  Excutes ones
sum +=i                  Excutes as many times as the input sixe and in this case $ times
return sum; Excutes once


Here Big - O is expressed in terms of the input where n+2
e.g the number of setps will be 4+2













 ig o focuses on the biiger picture without getting caught up in the small minute detils
Here the 2 can be igore with out causing a boig impact on the resul t where

n+2 can be simpley expresed as n

n = 100                  100+2
n = 1000                  100o+2
n = 10000                  10000+2
.
.
.
n = 1000000000                  10000000+2





1.S0 for our bove algortim , The worst case time complexti is

O(n) - Linear
Whicj is called linear complexity - As the input size increase the time also increases




QUESTIN - DO i HAVE TO CALCULATE THE COUNT LINE BY LINE TO DETERMINE THE TIME COMPLEXITY - nO SICE YOU CAN ALSO PERFORM SOME SAFE CALCULATION - mOST OF THE TIMES WHEN YOU SEE A LOOP IN YOUR CALCULATION, YOU CAN SAY THE TIME COMPLEXITY IS LINEAR
But loops being linears has some exceptions and is not  always the case






2.HERE IS ANOTHER WAY TO WRITE THE ABOVE ALGORITHM

function summation (n){
  return (n * (n+1)) /2
}

The time complecity of this one is
 O(1) - Called the Constent complexity - Irepepectibe of the size of n, Line two is only excuetd once, and hence time complexity is constant




3.Exampe another
If there are two nested loops the time complexty is quadaratic

e.g

 for (i=1;,i<=n;i++){
  for (j=1; j<=i;j++){
   
  }
 }


Time complexty
O(n^2) - Quaderatic

3n^2 +5n +1

Once a gain , the big O notation, brops the less releavnt or big terms


4.If ther are three neested loops then the time complexity is cubic

Time complexity 
O(n^3) - Cubic


 for (i=1;,i<=n;i++){
  for (j=1; j<=i;j++){
   for (k=1; k<=i;k++){
   
  }
 }



5. If input sixe reduces by havf every iteration the time complexity is Logarithimic

O(logn) - Logarithimic


Through out , we will be determing the various time compleityes of the algortms we will be using thought out the series





SPACE COMPLEXITY

o(1) - Constant space complexity - If the meory size foe the algoritm does not shift based on the input size, then the algorithm has a constant space complexity e.g sorthing algortim sthat a





































































