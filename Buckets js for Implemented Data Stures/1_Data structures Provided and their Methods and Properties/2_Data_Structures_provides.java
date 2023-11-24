Buckets-JS is a complete, fully tested, and documented data structure library written in pure JavaScript. It includes several data structures that you can use in your applications. Here are some of the data structures included in Buckets-JS:

1. **Set**: A Set is a collection of unique elements. It provides methods for adding elements, checking if an element is in the set, and removing elements.

2. **Dictionary**: A Dictionary is a collection of key-value pairs. It provides methods for adding key-value pairs, checking if a key exists in the dictionary, getting the value associated with a key, and removing key-value pairs.

3. **MultiDictionary**: A MultiDictionary is a dictionary that allows multiple values for the same key. It provides methods for adding values for a key, getting all values for a key, and removing values for a key.

4. **Heap**: A Heap is a binary tree where each parent node is less than or equal to its child nodes. Heaps can be either a min-heap, where each parent node is less than or equal to its child nodes, or a max-heap, where each parent node is greater than or equal to its child nodes.

5. **PriorityQueue**: A PriorityQueue is a queue where each element has a priority. Elements with higher priority are dequeued before elements with lower priority.

6. **Queue**: A Queue is a collection of elements where elements are added at the end and removed from the front.

7. **Stack**: A Stack is a collection of elements where elements are added and removed from the same end.

8. **LinkedList**: A LinkedList is a linear collection of elements where each element is a separate object. Each element contains a reference to the next element in the list.

9. **MultiSet**: A MultiSet is a collection of elements where each element can appear multiple times.

10. **BSTree**: A BSTree is a binary search tree. It is a tree where each node has at most two children, referred to as the left child and the right child. For each node, all elements in the left subtree are less than the node, and all elements in the right subtree are greater than the node.

11. **BSTreeMap**: A BSTreeMap is a binary search tree where each node stores a key-value pair. It provides methods for adding key-value pairs, getting the value associated with a key, and removing key-value pairs.

12. **BSTreeSet**: A BSTreeSet is a binary search tree where each node stores a unique element. It provides methods for adding elements, checking if an element is in the set, and removing elements.

Here is an example of how to use the Set data structure in Buckets-JS:

```javascript
var a = new buckets.Set();
var b = new buckets.Set();
a.add(1);
a.add(2);
b.add(2);
a.union(b); // {1,2}
```

In this example, two sets `a` and `b` are created. The number 1 is added to set `a`, and the number 2 is added to both set `a` and set `b`. The `union` method is then called on set `a` with set `b` as the argument, which returns a new set that is the union of `a` and `b` [Source 0](https://github.com/mauriciosantos/Buckets-JS), [Source 4](https://www.npmjs.com/package/buckets-js).

The performance characteristics of these data structures vary depending on the specific operations being performed. However, in general, these data structures provide efficient operations for adding, removing, and checking the presence of elements. The performance characteristics of these operations are typically O(1) for adding and removing elements, and O(log n) for checking the presence of an element in a binary search tree. For other operations such as finding the minimum or maximum element, the performance is typically O(log n) [Source 8](https://stackoverflow.com/questions/42399355/what-is-a-bucket-or-double-bucket-data-structure).

In functional programming, these data structures can be used to create pure functions that do not modify any external state. For example, you can create a function that takes a set and an element, and returns a new set that includes the element. This function would not modify the original set, but instead return a new set. This is in line with the principles of functional programming, which emphasize immutability and the avoidance of side effects [Source 6](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures), [Source 7](https://www.educative.io/blog/javascript-data-structures).






------------------------------------------------------------------------------------------------------------------------

  Buckets-JS is a complete, fully tested, and documented data structure library written in pure JavaScript. It includes several data structures that you can use in your applications. Here are some of the data structures included in Buckets-JS:

1. **Set**: A Set is a collection of unique elements. It provides methods for adding elements, checking if an element is in the set, and removing elements.

2. **Dictionary**: A Dictionary is a collection of key-value pairs. It provides methods for adding key-value pairs, checking if a key exists in the dictionary, getting the value associated with a key, and removing key-value pairs.

3. **MultiDictionary**: A MultiDictionary is a dictionary that allows multiple values for the same key. It provides methods for adding values for a key, getting all values for a key, and removing values for a key.

4. **Heap**: A Heap is a binary tree where each parent node is less than or equal to its child nodes. Heaps can be either a min-heap, where each parent node is less than or equal to its child nodes, or a max-heap, where each parent node is greater than or equal to its child nodes.

5. **PriorityQueue**: A PriorityQueue is a queue where each element has a priority. Elements with higher priority are dequeued before elements with lower priority.

6. **Queue**: A Queue is a collection of elements where elements are added at the end and removed from the front.

7. **Stack**: A Stack is a collection of elements where elements are added and removed from the same end.

8. **LinkedList**: A LinkedList is a linear collection of elements where each element is a separate object. Each element contains a reference to the next element in the list.

9. **MultiSet**: A MultiSet is a collection of elements where each element can appear multiple times.

10. **BSTree**: A BSTree is a binary search tree. It is a tree where each node has at most two children, referred to as the left child and the right child. For each node, all elements in the left subtree are less than the node, and all elements in the right subtree are greater than the node.

11. **BSTreeMap**: A BSTreeMap is a binary search tree where each node stores a key-value pair. It provides methods for adding key-value pairs, getting the value associated with a key, and removing key-value pairs.

12. **BSTreeSet**: A BSTreeSet is a binary search tree where each node stores a unique element. It provides methods for adding elements, checking if an element is in the set, and removing elements.

Here is an example of how to use the Set data structure in Buckets-JS:

```javascript
var a = new buckets.Set();
var b = new buckets.Set();
a.add(1);
a.add(2);
b.add(2);
a.union(b); // {1,2}
```

In this example, two sets `a` and `b` are created. The number 1 is added to set `a`, and the number 2 is added to both set `a` and set `b`. The `union` method is then called on set `a` with set `b` as the argument, which returns a new set that is the union of `a` and `b` [Source 0](https://github.com/mauriciosantos/Buckets-JS), [Source 4](https://www.npmjs.com/package/buckets-js).

The performance characteristics of these data structures vary depending on the specific operations being performed. However, in general, these data structures provide efficient operations for adding, removing, and checking the presence of elements. The performance characteristics of these operations are typically O(1) for adding and removing elements, and O(log n) for checking the presence of an element in a binary search tree. For other operations such as finding the minimum or maximum element, the performance is typically O(log n) [Source 8](https://stackoverflow.com/questions/42399355/what-is-a-bucket-or-double-bucket-data-structure).

In functional programming, these data structures can be used to create pure functions that do not modify any external state. For example, you can create a function that takes a set and an element, and returns a new set that includes the element. This function would not modify the original set, but instead return a new set. This is in line with the principles of functional programming, which emphasize immutability and the avoidance of side effects [Source 6](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures), [Source 7](https://www.educative.io/blog/javascript-data-structures).



..







