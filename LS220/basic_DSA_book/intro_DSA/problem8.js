// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  for (let i = n; i >= 1; i /= 2) {
    console.log("Hello!");
  }
}

// time complex O(logN) due to /2 before reaching 1
// space complex O(1)