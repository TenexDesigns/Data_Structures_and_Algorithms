Stacks are versatile data structures that can be used to solve a variety of problems in computing and algorithms. Here are some problems and tasks that can be solved using stacks:

Balanced parentheses: This is a common problem that can be solved using a stack. It involves checking whether the parentheses in an expression are balanced or not. For each opening parenthesis encountered in the expression, it is pushed onto the stack. For each closing parenthesis encountered, a matching opening parenthesis is popped from the stack. If the stack is empty at the end of the expression, the parentheses are balanced; otherwise, they are not.
Here is a Python code sample for this problem:

def is_balanced(expr):
    stack = []
    for char in expr:
        if char in ["(", "{", "["]:
            stack.append(char)
        else:
            if not stack:
                return False
            current_char = stack.pop()
            if current_char == '(':
                if char != ")":
                    return False
            if current_char == '{':
                if char != "}":
                    return False
            if current_char == '[':
                if char != "]":
                    return False
    if stack:
        return False
    return True

print(is_balanced("({})[]"))  # True
print(is_balanced("({)}[]"))  # False
stackoverflow.com

Postfix expression evaluation: Stacks can be used to evaluate postfix expressions (also known as Reverse Polish Notation). In this case, numbers are pushed onto the stack, and when an operator is encountered, the top two numbers are popped from the stack, the operation is performed, and the result is pushed back onto the stack.
Here is a Python code sample for this problem:

def evaluate_postfix(expression):
    stack = []
    for char in expression:
        if char.isdigit():
            stack.append(int(char))
        else:
            val1 = stack.pop()
            val2 = stack.pop()
            switcher = {
                "+": val2 + val1,
                "-": val2 - val1,
                "*": val2 * val1,
                "/": val2 / val1,
                "^": val2 ** val1
            }
            stack.append(switcher.get(char))
    return stack.pop()

print(evaluate_postfix("231*+9-"))  # -4
stackoverflow.com

Implementing function calls/ recursion: Stacks are used in programming languages to implement function calls and recursion. Each function call creates a new stack frame that contains the function's local variables and other information, and this frame is pushed onto the call stack. When the function returns, its stack frame is popped from the call stack.
Undo mechanism: Stacks can be used to implement an undo mechanism in text editors. Each operation (insertion, deletion, etc.) is pushed onto the stack. When the user performs an undo operation, the top operation is popped from the stack and reversed.
Tower of Hanoi: It is a mathematical puzzle. The puzzle starts with the disks in a neat stack in ascending order of size on one rod, the smallest at the top, thus making a conical shape. The objective of the puzzle is to move the entire stack to another rod, obeying the following rules:
Only one disk can be moved at a time.
Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack or on an empty rod.
No disk may be placed on top of a smaller disk.
Here is a Python code sample for this problem:

def TowerOfHanoi(n , source, destination, auxiliary):
    if n==1:
        print("Move disk 1 from source",source,"to destination",destination)
        return
    TowerOfHanoi(n-1, source, auxiliary, destination)
    print("Move disk",n,"from source",source,"to destination",destination)
    TowerOfHanoi(n-1, auxiliary, destination, source)
          
# Driver code
n = 3
TowerOfHanoi(n,'A','B','C') 
# A, C, B are the name of rods
