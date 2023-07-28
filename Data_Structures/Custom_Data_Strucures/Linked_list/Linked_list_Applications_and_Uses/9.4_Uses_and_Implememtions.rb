Linked lists are a linear data structure where elements are not stored at contiguous memory locations. The elements in a linked list are linked using pointers, with each node containing a data field and a reference(link) to the next node in the list geeksforgeeks.org, geeksforgeeks.org.

There are multiple types of linked lists, including singly linked lists, doubly linked lists, and circular linked lists. The type of linked list you choose to use will depend on your specific needs programiz.com.

Applications of Linked Lists

Implementation of graphs: Adjacency list representation of graphs is most popular which uses a linked list to store adjacent vertices geeksforgeeks.org.
Dynamic memory allocation: Linked lists are used for dynamic memory allocation. We use a linked list of free blocks geeksforgeeks.org.
Manipulation of polynomials: Constants in polynomials can be stored in the nodes of a linked list geeksforgeeks.org.
Browser History: In a web browser, the history of visited pages can be stored as a linked list. Each page visited can be represented by a node, with the link pointing to the next page visited freecodecamp.org.
Music Player: In a music player, the playlist can be represented as a linked list. Each song can be represented by a node, with the link pointing to the next song in the playlist freecodecamp.org.
Examples of Linked List Implementation

Heres an example of a singly linked list implemented in Python:

class Node:
    def __init__(self, data=None):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = Node()

    def append(self, data):
        new_node = Node(data)
        cur = self.head
        while cur.next!=None:
            cur = cur.next
        cur.next = new_node

    def display(self):
        elems = []
        cur_node = self.head
        while cur_node.next!=None:
            cur_node = cur_node.next
            elems.append(cur_node.data)
        print(elems)

my_list = LinkedList()

my_list.append(1)
my_list.append(2)
my_list.append(3)
my_list.append(4)

my_list.display()
In this code, a new node is appended to the list with the append method, and the list is displayed with the display method freecodecamp.org.

And heres an example of a doubly linked list implemented in Java:

public class DoublyLinkedList {
    Node head; // head of list

    class Node {
        int data;
        Node prev;
        Node next;

        // Constructor to create a new node
        Node(int d) { data = d; }
    }

    public void push(int new_data)
    {
        Node new_Node = new Node(new_data);
        new_Node.next = head;
        new_Node.prev = null;
        if (head != null)
            head.prev = new_Node;
        head = new_Node;
    }

    public void printlist(Node node)
    {
        Node last = null;
        while (node != null) {
            System.out.print(node.data + " ");
            last = node;
            node = node.next;
        }
    }

    public static void main(String[] args)
    {
        DoublyLinkedList dll = new DoublyLinkedList();
        dll.push(2);
        dll.push(4);
        dll.push(8);
        dll.push(10);
        dll.printlist(dll.head);
    }
}
In this code, a new node is added to the front of the list with the push method, and the list is printed with the printlist method programiz.com.
