// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      for (let k = 0; k < n; k++) {
        console.log("Hello!");
      }
    }
  }
}

// O(N^3) triple nested loop