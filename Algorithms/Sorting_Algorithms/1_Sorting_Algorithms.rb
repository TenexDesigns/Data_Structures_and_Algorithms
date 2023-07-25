There are several sorting algorithms commonly used in JavaScript to arrange elements in ascending or descending order. Lets explore some of the most popular sorting algorithms, their types, time complexity,
and ways to make them effective:



1.Bubble Sort:

Type: Comparison-based, stable sorting algorithm.
Time Complexity: Worst case O(n^2), Best case O(n) (with optimizations).
What It Does: Repeatedly compares adjacent elements and swaps them if they are in the wrong order, moving the larger elements towards the end of the array in each pass.

function bubbleSort(arr) {
  const n = arr.length;
  let swapped;

  for (let i = 0; i < n - 1; i++) {
    swapped = false;

    for (let j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        [arr[j], arr[j + 1]] = [arr[j + 1], arr[j]]; // Swap elements
        swapped = true;
      }
    }

    if (!swapped) break; // If no two elements were swapped, the array is already sorted
  }

  return arr;
}

const arr = [64, 34, 25, 12, 22, 11, 90];
console.log(bubbleSort(arr)); // Output: [11, 12, 22, 25, 34, 64, 90]

      
2.Selection Sort:
Type: Comparison-based, unstable sorting algorithm.
Time Complexity: Always O(n^2).
What It Does: Repeatedly selects the minimum (or maximum) element from the unsorted portion of the array and places it at the beginning (or end) of the sorted portion.

function selectionSort(arr) {
  const n = arr.length;

  for (let i = 0; i < n - 1; i++) {
    let minIndex = i;

    for (let j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    [arr[i], arr[minIndex]] = [arr[minIndex], arr[i]]; // Swap the minimum element with the current element
  }

  return arr;
}

const arr = [64, 34, 25, 12, 22, 11, 90];
console.log(selectionSort(arr)); // Output: [11, 12, 22, 25, 34, 64, 90]



    
3.Insertion Sort:
Type: Comparison-based, stable sorting algorithm.
Time Complexity: Worst case O(n^2), Best case O(n) (when the array is nearly sorted).
What It Does: Builds the sorted array one element at a time by repeatedly moving elements to their correct positions in the sorted part of the array.

function insertionSort(arr) {
  const n = arr.length;

  for (let i = 1; i < n; i++) {
    const key = arr[i];
    let j = i - 1;

    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = key;
  }

  return arr;
}

const arr = [64, 34, 25, 12, 22, 11, 90];
console.log(insertionSort(arr)); // Output: [11, 12, 22, 25, 34, 64, 90]



    
4.Merge Sort:
Type: Comparison-based, stable sorting algorithm.
Time Complexity: Always O(n log n).
What It Does: Divides the unsorted array into two halves, recursively sorts each half, and then merges the sorted halves back together.

function mergeSort(arr) {
  if (arr.length <= 1) return arr;

  const mid = Math.floor(arr.length / 2);
  const left = mergeSort(arr.slice(0, mid));
  const right = mergeSort(arr.slice(mid));

  return merge(left, right);
}

function merge(left, right) {
  const result = [];
  let leftIndex = 0;
  let rightIndex = 0;

  while (leftIndex < left.length && rightIndex < right.length) {
    if (left[leftIndex] < right[rightIndex]) {
      result.push(left[leftIndex]);
      leftIndex++;
    } else {
      result.push(right[rightIndex]);
      rightIndex++;
    }
  }

  return result.concat(left.slice(leftIndex)).concat(right.slice(rightIndex));
}

const arr = [64, 34, 25, 12, 22, 11, 90];
console.log(mergeSort(arr)); // Output: [11, 12, 22, 25, 34, 64, 90]


    
5.Quick Sort:
Type: Comparison-based, unstable sorting algorithm.
Time Complexity: Worst case O(n^2), Average case O(n log n) (with good pivot selection).
What It Does: Divides the unsorted array into two subarrays around a pivot element, recursively sorts each subarray, and concatenates them to form the sorted array.

function quickSort(arr) {
  if (arr.length <= 1) return arr;

  const pivot = arr[0];
  const left = [];
  const right = [];

  for (let i = 1; i < arr.length; i++) {
    if (arr[i] < pivot) {
      left.push(arr[i]);
    } else {
      right.push(arr[i]);
    }
  }

  return [...quickSort(left), pivot, ...quickSort(right)];
}

const arr = [64, 34, 25, 12, 22, 11, 90];
console.log(quickSort(arr)); // Output: [11, 12, 22, 25, 34, 64, 90]

    
Sorting algorithms are essential in programming for data manipulation and organization. The choice of sorting algorithm depends on the specific requirements of the application, the size of the dataset, and the desired efficiency. In many programming languages, including JavaScript, the built-in sort method uses a variation of quicksort or mergesort for efficient sorting. Its essential to understand the characteristics and complexity of different sorting algorithms to choose the most appropriate one for the task at hand.











