// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  let sum = 0;
  for (let i = 1; i <= n; i++) {
    for (let j = 1; j <= i; j++) {
      sum += 1;
    }
  }
  return sum;
}

// time complexity: O(N^2)
// space complexity: O(1)? (correct)