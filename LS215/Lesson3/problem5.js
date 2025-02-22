// 2.  Array Chunking:
// Create a function that takes an array and a chunk size, then returns a new array of subarrays, each at most the chunk size.

/*

*/

console.log(chunk([1, 2, 3, 4, 5], 2));// == [[1, 2], [3, 4], [5]]
console.log(chunk([1, 2, 3, 4, 5, 6, 7, 8], 3));// == [[1, 2, 3], [4, 5, 6], [7, 8]]
console.log(chunk([1, 2, 3, 4, 5], 10));// == [[1, 2, 3, 4, 5]]