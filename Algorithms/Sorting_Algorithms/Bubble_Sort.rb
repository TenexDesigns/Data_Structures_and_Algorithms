function bubbleSort(arr){

  let swapped;

  do{
    swapped = false;

    for(let i =0; i < arr.length -1; i++){
      if(arr[i] > arr[i+1] ){
        let temp = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = temp
        swapped = true

      }
    }
  } while(swapped)
}





const arr = [ 5,6,7,7,8,4,2,42,4,5,-8,5,7,4,-76,6,4,5,-74]


bubbleSort(arr)

console.log(arr)




      
The provided code correctly implements the Bubble Sort algorithm to sort the given array arr in ascending order.

Bubble Sort is a simple comparison-based sorting algorithm. It repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. It continues this process until no more swaps are needed, indicating that the list is sorted.

In the code you provided:

The do...while loop is used to repeatedly go through the array until no more swaps are needed (i.e., the swapped variable becomes false).
Inside the loop, the for loop compares adjacent elements in the array. If the current element is greater than the next element, they are swapped using a temporary variable (temp), effectively moving the larger element towards the end of the array.
The swapped variable is set to true if any swaps occur during the loop. If no swaps occur, it means the array is already sorted, and the loop stops.
The process continues until the entire array is sorted.
Time Complexity:

The time complexity of Bubble Sort is O(n^2) in the worst and average cases, where n is the number of elements in the array. This is because, in the worst case, the algorithm needs to make n*(n-1)/2 comparisons and swaps. The best-case time complexity of Bubble Sort is O(n) when the array is already sorted. However, the overall performance of Bubble Sort is usually poor for large datasets compared to more efficient sorting algorithms like Merge Sort or Quick Sort.

In the provided code, the Bubble Sort algorithm is implemented correctly, and it will sort the given array arr in ascending order.



MORE EXPLANANTION
  ************************************************************************************************************************************************


  Bubble Sort:
  
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



      
MORE EXPLANANTION
******************************************************************************************************************************

Bubble Sort
Bubble sort is a simple comparison-based algorithm that works by repeatedly swapping the adjacent elements if they are in the wrong order. The time complexity of the bubble sort algorithm is O(n^2) in the worst and average cases.

Heres an example of bubble sort in JavaScript:

   function bubbleSort(arr) {
       let len = arr.length;
       for (let i = 0; i < len; i++) {
           for (let j = 0; j < len - i - 1; j++) {
               if (arr[j] > arr[j + 1]) {
                   let temp = arr[j];
                   arr[j] = arr[j + 1];
                   arr[j + 1] = temp;
               }
           }
       }
       return arr;
   }

   let arr = [64, 34, 25, 12, 22, 11, 90];
   bubbleSort(arr);
   console.log("Sorted array: " + arr);


      
