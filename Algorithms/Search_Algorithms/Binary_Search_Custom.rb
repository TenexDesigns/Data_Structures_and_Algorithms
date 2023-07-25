
function binarySearch(arr,target){
  let leftIndex = 0
  let rightIndex = arr.length -1

  while(leftIndex <= rightIndex){
    let middleIndex = Math.floor((leftIndex+rightIndex)/2)
    if(target === arr[middleIndex]){
      return middleIndex
    }
    if(target < arr[middleIndex]){
      rightIndex = middleIndex -1
    } else {
      leftIndex = middleIndex+1
    }
  }

  return -1
}




console.log(binarySearch([-5,2,3,4,5,10,13, 16, 18,34,56,77,889,1234,56542],4))
console.log(binarySearch([-5,2,3,4,5,10,13, 16, 18,34,56,77,889,1234,56542],44))
console.log(binarySearch([-5,2,3,4,5,10,13, 16, 18,34,56,77,889,1234,56542],18))
console.log(binarySearch([-5,2,3,4,5,10,13, 16, 18,34,56,77,889,1234,56542],77))
console.log(binarySearch([-5,2,3,4,5,10,13, 16, 18,34,56,77,889,1234,56542],5542))






    
