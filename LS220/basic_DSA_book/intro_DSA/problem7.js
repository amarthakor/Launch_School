// What is the time complexity of the function test? What is its space complexity?

function test(n) {
  let result = [];
  for (let i = 0; i < n; i++) {
    result.push(new Array(n).fill(0));
  }
  return result;
}

// time complex O(N)
// spacecomplex array of nested arrays is O(N^2)?