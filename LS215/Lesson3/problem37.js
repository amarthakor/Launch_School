// 4.  ​Intermediate​: Implement a function that performs a deep clone of an object containing nested objects and arrays, but excludes any properties whose values are functions. Your solution should create a completely new object with no references to the original.

// Test cases
const original = {
  name: 'Test Object',
  data: [1, 2, 3],
  nested: {
    a: 'value',
    b: [4, 5, 6],
    c: { more: 'data' },
    method: function() { return 'hello'; }
  },
  handler: () => console.log('clicked')
};

const clone = deepCloneExcludingFunctions(original);
console.log(clone);
/* Expected output similar to:
{
  name: 'Test Object',
  data: [1, 2, 3],
  nested: {
    a: 'value',
    b: [4, 5, 6],
    c: { more: 'data' }
  }
}
*/

// Test that functions were removed
console.log(clone.handler); // undefined
console.log(clone.nested.method); // undefined

// Test that original and clone are separate objects
original.data.push(4);
console.log(original.data); // [1, 2, 3, 4]
console.log(clone.data); // [1, 2, 3]

// Test with complex arrays
const complexArray = [
  { id: 1, fn: () => {} },
  [{ nested: true, callback: function() {} }]
];
console.log(deepCloneExcludingFunctions(complexArray));
// [{ id: 1 }, [{ nested: true }]]