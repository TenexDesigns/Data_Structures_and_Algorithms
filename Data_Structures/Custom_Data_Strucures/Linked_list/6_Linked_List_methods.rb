Linked List in JavaScript
A linked list is a linear data structure, similar to an array. However, unlike arrays, elements are not stored in a particular memory location or index. Each element is a separate object that contains a pointer or a link to the next object in that list. Each element (commonly called nodes) contains two items: the data stored and a link to the next node. The data can be any valid data type. The entry point to a linked list is called the head. The head is a reference to the first node in the linked list. The last node on the list points to null. If a list is empty, the head is a null reference freecodecamp.org.

Here is an example of a linked list in JavaScript:

const list = {
    head: {
        value: 6,
        next: {
            value: 10,                                             
            next: {
                value: 12,
                next: {
                    value: 3,
                    next: null	
                }
            }
        }
    }
};
Methods of Linked List in JavaScript
Common methods that can be implemented on a Linked List include:

add(value): This method adds a new node to the end of the list.
    add(value) {
        const newNode = {value}; // create a new node
        if (this.head === null) {
            this.head = newNode;
        } else {
            let current = this.head;
            while (current.next !== null) {
                current = current.next;
            }
            current.next = newNode;
        }
        this.length++;
    }

delete(value): This method removes a node with the given value from the list.
    delete(value) {
        if (this.length === 0) {
            return null;
        }
        if (this.head.value === value) {
            this.head = this.head.next;
            this.length--;
            return;
        }
        let previousNode = this.head;
        let currentNode = this.head.next;
        while (currentNode !== null) {
            if (currentNode.value === value) {
                break;
            }
            previousNode = currentNode;
            currentNode = currentNode.next;
        }
        if (currentNode === null) {
            return null;
        }
        previousNode.next = currentNode.next;
        this.length--;
    }

find(value): This method finds a node with the given value.
    find(value) {
        if (this.length === 0) {
            return null;
        }
        let currentNode = this.head;
        while (currentNode !== null) {
            if (currentNode.value === value) {
                return currentNode;
            }
            currentNode = currentNode.next;
        }
        return null;
    }
  
Additional methods can be created for traversing the list, getting the size of the list, etc freecodecamp.org, sebhastian.com.

Time Complexity
The time complexity for operations in a Linked List can be as follows:

Access: O(n)
Search: O(n)
Insertion: O(1)
Deletion: O(1)
These complexities are due to the fact that to access or search for a particular node, in the worst-case scenario, we may need to traverse all the nodes in the list. However, insertion and deletion at the beginning of the list can be done in constant time as it requires only a change of a pointer freecodecamp.org.



...
