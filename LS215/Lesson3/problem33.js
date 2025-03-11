// Write a method that takes a nested array structure and performs a deep transformation based on the following rules:
// •   If an element is a number, double it
// •   If an element is a string, reverse it
// •   If an element is an array, apply these rules recursively to each element
// •   If an element is any other type, leave it unchanged

/*
-- Problem --
INPIT: array of elements
OUTPUT: array of elements

Rules:
  - Given a nested array structure
  - Perform a deep transformation based on the element type
    - if ele === string, reverse string
    - If ele === number, double it
    - If ele === array, apply these rules to each element recursively
      - Waht does recursively mean in this context?
      - Any further nested subarrays must be transformed as well
    - If ele !== any of the previous types, leave it unchanged

Assumptions:
- If given an ele === array, is it possible that the array can contain a subarray (3D array?)
  - Yes, a subarray can contain another subarray or nested subarrays
- How should we handle non array args?
  - Return null
- How should we handle empty array args?
  - REturn empty array
- What about sparse arrays?
  - Will not be provided sparse arrays
- What about additional args?
  - Ignore all additional arguments
- Are floats, special number types such as Infinity, NaN etc. a number?
  - Yes, all number types are considered numbers

-- Examples --
- Given [1, { a: 2 }, [3, "xyz"]]))
  - 2
  - {a: 2}
  - 6, "zyx"
  -> [2, {a: 2}, [6, 'zyx']];

- Given 132
  - Return null since not an array

- Given []
  - Return [] as per rules

- Given [1, { a: 2 }, [3, "xyz"]], [1, 2, 3]
  - ignore all additional args
  -> [2, {a: 2}, [6, 'zyx']];

-- Data Structures --
- Given array
- Return an array
- Will allow to iterate over each element
- Can also perform transformation and reversal
- Stick with array DS as most ideal solution

-- Algorithm --
1. Handle non array and empty array arguments
2. For each element, transform it based on the rules described above ** helper
3. Return the transformed array

helper func transformElements
1. For each element, transform it based on the rules described above ** helper
- For each element
  - If the element is a number
    - double it
  - Else if hte element is a string
    - reverse it
  - Else if hte element is an array
    - Invoke transformArray helper recursively
  - Otherwise
    - return the current element as is
- Return the transformed array

helper transformSubarray
- For each element
  - If the element is a number
    - double it
  - Else if hte element is a string
    - reverse it #split #reverse # join
  - Else if hte element is an array
    - Apply the changes to each element as above ** helper method
  - Otherwise
    - return the current element as is
- Return the transformed array

*/
function deep_transform(structure) {
  if (!Array.isArray(structure)) return null;
  return transformArray(structure);
}

function transformArray(array) {
  array = array.map(ele => {
    if (typeof ele === 'number') {
      return ele * 2;
    } else if (typeof ele === 'string') {
      return ele.split('').reverse().join('');
    } else if (Array.isArray(ele)) {
      return transformArray(ele);
    } else {
      return ele;
    }
  });

  return array;
}

// COMPLETED IN 21:41 MINUTES
// # Test cases
console.log(deep_transform([1, 2, 3]));// # => [2, 4, 6]
console.log(deep_transform(["hello", "world"]));// # => ["olleh", "dlrow"]
console.log(deep_transform([1, [2, "abc"], 3]));// # => [2, [4, "cba"], 6]
console.log(deep_transform([1, { a: 2 }, [3, "xyz"]]));// # => [2, {a: 2}, [6, "zyx"]]
console.log(deep_transform([1, { a: 2 }, [3, "xyz", [1, 2, '345']]]));
console.log(deep_transform(123));
console.log(deep_transform([]));
// Edge cases with special numbers
console.log(deep_transform([NaN, Infinity, -0])); // [NaN, Infinity, -0]

// Mixed nested arrays with various types
console.log(deep_transform([[["abc"], 1], [], [null, undefined]])); 
// => [[["cba"], 2], [], [null, undefined]]

// Deep nesting
console.log(deep_transform([[[[[1]]]]])); // => [[[[[2]]]]]

// Empty strings
console.log(deep_transform(["", "a", ""])); // => ["", "a", ""]

// Functions and other objects
const func = () => {};
console.log(deep_transform([func, new Date(), /regex/])); 
// => [func, Date object, /regex/]

// Test with mutable objects to ensure no side effects
const obj = { a: 1 };
const arr = [obj];
const result = deep_transform(arr);
obj.a = 2;
console.log(result[0].a); // Should be 1 if deep copy, 2 if shallow