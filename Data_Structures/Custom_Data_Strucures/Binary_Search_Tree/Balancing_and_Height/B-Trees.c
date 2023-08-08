## B-Trees

B-Trees are self-balancing search trees commonly used in databases and file systems. Each node in a B-Tree can contain more than one key and have more than two children. B-Trees follow these properties:

1. Every node has up to `m` children where `m` is the order of the tree.
2. Every non-leaf node (except root) has at least `m/2` child nodes. If the tree is not empty, the root has at least two children.
3. All leaves appear in the same level, and carry no information.
4. A non-leaf node with `k` children contains `k-1` keys [Source 1](https://en.wikipedia.org/wiki/B-tree), [Source 5](https://www.baeldung.com/cs/b-tree-data-structure).

B-Trees are used extensively in file systems and databases because they are efficient for large amounts of data that doesn't fit into main memory. They minimize disk I/O operations and allow for efficient insertion, deletion, and search operations.

Unfortunately, implementing B-Trees in JavaScript is quite complex and beyond the scope of this response. However, you can find a full implementation in the [GeeksforGeeks B-Tree tutorial](https://www.geeksforgeeks.org/b-tree-set-1-introduction-2/).
