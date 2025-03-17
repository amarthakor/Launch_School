// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  let result = [];
  for (let i = 0; i < n; i++) {
    result.push(i);
  }
  return result;
}

// O(N) time complexity
// Space complexity is O(N) bc we are pushing each element into `results` i think
// **The space complexity is also O(N) as the result array grows linearly with the input size n.**
