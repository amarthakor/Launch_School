// Write a function `rooms` that determines the minimum number of
// rooms required to handle a series of interviews given their
// time intervals.

// Each interval is represented as an array [start, end],
// where `start` is the start time and `end` is the end
// time of the interview.

// The function should return the number of conference rooms
// required to ensure no two interviews overlap in the same room.

/*
--- Problem


*/

// Example I:
// Input: intervals = [[20, 25], [10, 15], [0, 25]]
// Output: 2
// Explanation: The first interview is scheduled from
//              time 0 to 25. The second interview is
//              from time 10 to 15 and overlaps with
//              the first interview, requiring a second
//              room. The third interview from 20 to 25
//              also overlaps with the first. Thus, a
//              minimum of two rooms are required.

// Example II:
// Input: intervals = [[5, 9], [1, 3]]
// Output: 1
// Explanation: The first interview is scheduled from
//              time 5 to 9. The second interview is
//              from time 1 to 3. These two interviews
//              do not overlap, therefore only one
//              conference room is needed.


/* if END > START +1 rooms, ELSE +1 endTimes
regardless, +1 starting room
[1, 2, 4, 5]
[3, 5, 6, 7]

3 > 1, rooms = 1, start = 2
3 > 2, rooms = 2, start = 4
3 < 4, end = 5, start = 5
5 > 5 end = 6, start = null end
rooms = 2 WORKS

--- Algorithm
1. if array length is 0, return 0
2. create array of start times sorted
3. create array of end times sorted
4. set start end and roomCount to 0
5. find rooms needed
- while start is less than array length
  - if endtime is greater than starttime
    +1 room time
  - else
    - +1 end time
  - +1 starttime
6. return room count
*/

// Test Cases:

function rooms(intervals) {
  let [start, end, rooms] = [0, 0, 0];
  let startTimes = intervals.map(times => times[0]).sort((a, b) => a - b);
  let endTimes = intervals.map(times => times[1]).sort((a, b) => a - b);

  while (start < intervals.length) {
    if (endTimes[end] > startTimes[start]) {
      rooms += 1;
    } else {
      end += 1;
    }
    start += 1
  }

  return rooms;
}

console.log(rooms([[20, 25], [10, 15], [0, 25]]) === 2);
console.log(rooms([[5, 9], [1, 3]]) === 1);
console.log(rooms([[1, 2], [3, 4], [5, 6]]) === 1);
console.log(rooms([[1, 4], [2, 5], [3, 6]]) === 3);
console.log(rooms([[1, 3], [3, 6], [6, 8]]) === 1);
console.log(rooms([[1, 10]]) === 1);
console.log(rooms([[1, 3], [2, 4], [4, 6]]) === 2);
console.log(rooms([[1, 5], [2, 3], [4, 6], [5, 7]]) === 2);
console.log(rooms([[0, 5], [1, 3], [2, 6], [4, 7], [5, 9], [8, 10]]) === 3);
console.log(rooms([[1, 2], [2, 3], [3, 4], [4, 5]]) === 1);
console.log(rooms([[1, 20], [5, 10], [11, 15], [16, 18]]) === 2);
console.log(rooms([[1, 4], [1, 3], [1, 2], [1, 5]]) === 4);
// All test cases should log true