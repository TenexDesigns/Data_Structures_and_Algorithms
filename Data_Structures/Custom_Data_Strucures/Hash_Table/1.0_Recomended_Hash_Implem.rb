This is the recomended impleemntion because it considers the follwing



Load Factor: The load factor is the ratio of the number of filled slots to the total number of slots in the hash table.
Maintaining a low load factor (e.g., below 0.7 or 0.8) helps reduce the likelihood of collisions.
    As the number of elements in the hash table increases, resizing the hash table and rehashing the elements can be done to keep the load factor low.

Good Hash Function: Using a good hash function is crucial to minimize collisions. A good hash function should uniformly distribute the keys across the hash table, 
    reducing the chances of multiple keys mapping to the same index. It should aim to produce as few collisions as possible. Various techniques and algorithms can be used to design effective hash functions for different types of data.

Separate Chaining with Good Linked List or array: If you choose to use separate chaining to handle collisions, consider using a good linked list implementation. 
            For example, using singly linked lists instead of doubly linked lists can reduce memory overhead and improve cache locality.
    
We also search for uniquesnes of the keys being input.


  

class HashTable {
  constructor(initialCapacity = 8) {
    this.buckets = new Array(initialCapacity);
    this.numBuckets = this.buckets.length;
    this.size = 0;
    this.MAX_LOAD_FACTOR = 0.7;
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


      /* Think of the arrangement of this hash table like this. It is an array of arrays that house other arrays,
      [
          [
              [k,v],[k,v]
          ],
          
          [
              [k,v],[k,v]
          ]
      ],
      where th hash function gives you the inedx to store the key valye arry in
let hashTable = [
  //Key Value pair     /Index from Hash function
    [['key1','value1']],  //0
    // 0      //1
    [['key2','value2']],  //1
    // 0      //1
    [['key3','value3']],  //2
    // 0      //1
    [['key4','value4']],  //3
    // 0      //1
    [['key5.0','value5.0'],[['key5.1','value5.1'],[['key5.2','value5.2']],  //4  THis occurs when there is a collison(when hash function genrates same index from key). To access key or value  from a clollided ayyya
    // hashTable[4][1][0] -->    'key5.1' To access key in a coliided index

    //The key value pair is an array, and they are stored on index 0 and 1 in that array
]

console.log(arr[1][0])
          /*
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
         let len = this.buckets[index]

    for(let i = 0; i <len.length;i++){
        if( len[i][0]=== key)
        {
            return len[i]
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
         let len = this.buckets[index]
        
    for(let i = 0; i <len.length;i++){
        if( len[i][0]=== key)
        {
            return true
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





the time complexity of the above methods
************************************************************************************************************************************************

The time complexities of the methods in the HashTable implementation are as follows:

hash(key): This method calculates the hash value for the given key by iterating through each character of the key and summing up their ASCII values. The time complexity of this method is O(k), where k is the length of the key.

set(key, value): The time complexity of this method is O(1) on average. When there are no collisions, and a new key-value pair is inserted into an empty bucket, it takes constant time to append the key-value pair to the bucket. However, in the worst-case scenario, when there are many collisions and the hash table needs to be resized and rehashed, the time complexity can become O(n), where n is the number of key-value pairs in the hash table.

resize(): The resize method doubles the size of the hash table and rehashes all existing key-value pairs. Since it needs to rehash all elements, the time complexity of this method is O(n), where n is the number of key-value pairs in the hash table.

get(key): The time complexity of this method is O(1) on average. In the best-case scenario, the key is in the first position of the bucket, and the method returns in constant time. However, in the worst-case scenario, when there are many collisions, it may need to iterate through the entire bucket to find the key, leading to a linear search with a time complexity of O(k), where k is the average size of the bucket.

remove(key): The time complexity of this method is O(1) on average. Similar to the get method, the worst-case time complexity can be O(k), where k is the average size of the bucket.

has(key): The time complexity of this method is O(1) on average. It calculates the index using the hash method and then performs a constant-time check to see if the bucket contains any key-value pairs.

getSize(): The getSize method returns the size of the hash table, which is stored as a property and accessed directly. So, this method has a time complexity of O(1).

isEmpty(): The isEmpty method checks if the size of the hash table is zero. It also has a time complexity of O(1) since it directly accesses the size property.

Overall, most operations on the hash table have an average time complexity of O(1), which means they take constant time on average. However, in the worst-case scenario with many collisions, some methods can have a time complexity of O(n), where n is the number of key-value pairs in the hash table or the average size of the buckets. The resizing operation, which happens less frequently, also has a time complexity of O(n) but is amortized over multiple insertions.





    

