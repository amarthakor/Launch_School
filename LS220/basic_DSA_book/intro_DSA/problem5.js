// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  let result = [];
  for (let i = 0; i < n; i++) {
    result.push(i);
    for (let j = 0; j < n; j++) {
      result[i] += j;
    }
  }
  return result;
}

// time complexity: O(N^2)
// space complex: O(N) bc `result` grows as `n` grows linearly