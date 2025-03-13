// 2.  ​Basic​: Create a function that accepts an object and returns an array of its key-value pairs, where each pair is represented as a two-element array: [key, value].

/*
starttime 6:20pm
end time 6:30pm

-- Problem --
INPUT: object
OUTPUT: nested array

Rules:
  - Given an array of objets
  - REturn an array where elements are composed of
    - the KV pairs of the object in a 2 element array
    - Thus each subarray will have 2 elements, a K and a V

Assumptions:
- How should we handle a non array object argument
  - Return null
- What about additional arguments?
  - Ignore additional arguments
- The 2nd test case passes an empty {} and returns an empty [], is this the correct way to
  handle this argument?
  - Yes

-- Examples --
- given { name: 'John', age: 30 }
  - Return a 2D array of subarrays where eahc subarr are the KV pairs of the object
  - [[name john], [age 30]]

-- Data Structure --
- given an object
- want to return an array
- going to need an array
- can iterate over the object to utilize both key and value

-- Algorithm --
1. Handle null cases
2. Create a holding array for results
3. Convert each KV in the given object into a 2 element array and push it to the holding array
- Loop over each KV pair in our given obj
  - For each KV pair
  - Store the k and the v in an array and then push this array into our holding array
4. REturn the holding array of KV pairs
*/

function objectToPairs(obj) {
  if (typeof obj !== 'object' || Array.isArray(obj)) return null;

  let pairs = [];
  for (let key in obj) {
    pairs.push([key, obj[key]]);
  }

  return pairs;
}

// Test cases
console.log(objectToPairs({ name: 'John', age: 30 })); 
// [['name', 'John'], ['age', 30]]
console.log(objectToPairs({})); 
// []
console.log(objectToPairs({ a: 1, b: 2, c: 3 })); 
// [['a', 1], ['b', 2], ['c', 3]]
console.log(objectToPairs({ key: null, another: undefined, third: '' })); 
// [['key', null], ['another', undefined], ['third', '']]
console.log(objectToPairs([])); // null
console.log(objectToPairs(123456235)); // null 