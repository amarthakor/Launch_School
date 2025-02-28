// 3.  Merge Intervals
// Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

/*
---- PROBLEM
*/

console.log(mergeIntervals([[1,3],[2,6],[8,10],[15,18]]));
// // should return [[1,6],[8,10],[15,18]]

console.log(mergeIntervals([[1,4],[4,5]]));
// should return [[1,5]]

console.log(mergeIntervals([[1,4],[0,2],[3,5]])); // should return [[0,5]]
console.log(mergeIntervals([[1,4],[2,3]])); // should return [[1,4]]
console.log(mergeIntervals([[1,4],[0,0]])); // should return [[0,0],[1,4]]
console.log(mergeIntervals([[1,4],[0,1]])); // should return [[0,4]]
console.log(mergeIntervals([[1,3],[2,6],[8,10],[15,18],[17,20]])); // should return [[1,6],[8,10],[15,20]]