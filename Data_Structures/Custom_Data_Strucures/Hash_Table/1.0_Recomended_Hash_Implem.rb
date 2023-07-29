This is the recomended impleemntion because it considers the follwing



Load Factor: The load factor is the ratio of the number of filled slots to the total number of slots in the hash table. Maintaining a low load factor (e.g., below 0.7 or 0.8) helps reduce the likelihood of collisions. As the number of elements in the hash table increases, resizing the hash table and rehashing the elements can be done to keep the load factor low.

Good Hash Function: Using a good hash function is crucial to minimize collisions. A good hash function should uniformly distribute the keys across the hash table, reducing the chances of multiple keys mapping to the same index. It should aim to produce as few collisions as possible. Various techniques and algorithms can be used to design effective hash functions for different types of data.

Separate Chaining with Good Linked List or array: If you choose to use separate chaining to handle collisions, consider using a good linked list implementation. For example, using singly linked lists instead of doubly linked lists can reduce memory overhead and improve cache locality.
    
We also search for uniquesnes of the keys being input.


  

class HashTable {
  constructor(initialCapacity = 8) {
    this.buckets = new Array(initialCapacity);
    this.numBuckets = this.buckets.length;
    this.size = 0;
    this.MAX_LOAD_FACTOR = 0.75;
  }

  # hash(key) {
  #   let hashValue = 0;
  #   for (let i = 0; i < key.length; i++) {
  #     hashValue += key.charCodeAt(i);
  #   }
  #   return hashValue % this.numBuckets;
  # }

  #This is a better  hashing function than the one above. It is called DJB2 hash function:, Fead more about it on this  director on a file called Good function
#//1.Good Has function
  hash(key) {
  let hash = 5381;
  for (let i = 0; i < key.length; i++) {
    hash = (hash * 33) ^ key.charCodeAt(i);
  }
  return Math.abs(hash) %  this.numBuckets;
}

    #1.Uniqueens of keys
  set(key, value) {
    const index = this.hash(key);

    if (!this.buckets[index]) {
      this.buckets[index] = [];
    } else {
      for (let i = 0; i < this.buckets[index].length; i++) {
        if (this.buckets[index][i][0] === key) {
          throw new Error('Key already exists');
        }
      }
    }

    this.buckets[index].push([key, value]);
    this.size++;

    if (this.size / this.numBuckets > this.MAX_LOAD_FACTOR) {
      this.resize();
    }
  }


        #3.Resizing and rehashing
  resize() {
    const oldBuckets = this.buckets;
    this.numBuckets *= 2; // double the size
    this.buckets = new Array(this.numBuckets);
    this.size = 0;

    for (let i = 0; i < oldBuckets.length; i++) {
      if (oldBuckets[i]) {
        for (let j = 0; j < oldBuckets[i].length; j++) {
          this.set(oldBuckets[i][j][0], oldBuckets[i][j][1]);
        }
      }
    }
  }

  get(key) {
    const index = this.hash(key);
    if (this.buckets[index]) {
      for (const item of this.buckets[index]) {
        if (item[0] === key) {
          return item[1];
        }
      }
    }
    return undefined;
  }

  remove(key) {
    const index = this.hash(key);
    if (this.buckets[index]) {
      for (let i = 0; i < this.buckets[index].length; i++) {
        if (this.buckets[index][i][0] === key) {
          const removedItem = this.buckets[index].splice(i, 1);
          this.size--;
          return removedItem[0][1];
        }
      }
    }
    return undefined;
  }

  has(key) {
    const index = this.hash(key);
    if (this.buckets[index]) {
      for (const item of this.buckets[index]) {
        if (item[0] === key) {
          return true;
        }
      }
    }
    return false;
  }

  getSize() {
    return this.size;
  }

  isEmpty() {
    return this.size === 0;
  }
}
In this implementation, we use the ES6 class syntax to define the HashTable class. The methods are defined as class methods using the methodName() {} syntax.

The HashTable class includes the following methods:

constructor: Initializes the hash table with the specified initialCapacity, defaulting to 8, and sets other initial properties like numBuckets, size, and MAX_LOAD_FACTOR.

hash(key): Calculates the hash value for the given key. It uses the ASCII values of the characters in the key and performs modulo division to determine the index.

set(key, value): Adds a key-value pair to the hash table. It uses the hash method to calculate the index, handles collisions by storing multiple key-value pairs in separate arrays within the same bucket, and resizes the hash table if the load factor exceeds the maximum load factor.

resize(): Doubles the size of the hash table and rehashes all existing key-value pairs to distribute them evenly in the newly sized hash table.

get(key): Retrieves the value associated with the given key from the hash table.

remove(key): Removes the key-value pair associated with the given key from the hash table.

has(key): Checks if a given key exists in the hash table.

getSize(): Returns the number of key-value pairs in the hash table.

isEmpty(): Checks if the hash table is empty (contains no key-value pairs).

By using the class syntax, we can encapsulate the hash table implementation and its methods within a single class, making it more organized and easier to work with.




