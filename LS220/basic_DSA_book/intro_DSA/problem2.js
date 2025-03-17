// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  for (let i = 0; i < n; i++) {
    for (let j = i; j < n; j++) {
      console.log("Hello!");
    }
  }
}

// O(N^2) since we have a nested loop structure -> quadratic time complexity
// space complexity is O(1) as no additional spaced is propertional to `N` is used
