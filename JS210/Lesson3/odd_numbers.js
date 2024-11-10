// Write a function that takes a positive integer as an argument, and 
// logs all the odd numbers from 1 to the passed in number (inclusive).
// All numbers should be logged on separate lines.

// logOddNumbers(19);

// // output on console
// 1
// 3
// 5
// 7
// 9
// 11
// 13
// 15
// 17
// 19

// need to log all odd numbers starting from 1 to number
// - assume argument will be positive integer
// create var and set to 0
// loop from 0 to number value
  // if current num is odd
    // log to console
  // otherwise continue 
  // increment current num by 1
  // once current num is greater than given num, exit loop

function logOddNumbers(number) {
  for (let currentNum = 0; currentNum <= number; currentNum += 1) {
    if (currentNum % 2 === 1) {
      console.log(currentNum)
    }
  }
}

logOddNumbers(19);
logOddNumbers(11);