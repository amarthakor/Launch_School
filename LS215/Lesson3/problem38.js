// Problem​: Write a function called processTransactions that takes an array of transaction objects and returns a new object that summarizes the total amount spent per category.

// 6:00PM - 6:10pm
/*
-- Problem --
iNPUT: an array of object ltierals
output: object

Rules:
  - Given an array of objects
    - Each object is a transaction
    - consist of id, amount, and category properties
  - add the total for each category
  - return a single object with:
    - each category and its total sum transactional cost

Assumptions:
- Will we ever be given an empty array?
  - Return empty object if so
- What about an array with non obj literals?
  - No, always obj literals within the array
- What about a sprase array?
  - Never given a sparse array
- What about additional arguments?
  - Ignore all additional arguments
- What about non array args?
  - Return null if given

-- Examples --
- food, transportation
  - food -> 50, 20 = 70
  - transportation -> 30
-> {food: 70, transportation: 30}

- Given []
  -> {} due to empty array conditional

- Given 1234
  - Return null due to wrong arg type

-- Data Structures --
- can use array to iterate over each obj and identify unique categories
- for each obj KV pair, 
  - can iterate over given array and identify all amounts required
- then return obj to statisfy problem req's

-- Algorithm --
1. Handle empty / null cases
2. Create an obj of all unique categories
  - Create an empty obj
  - For each element
    - If the obj[category type] doesn't exist
      - Create it and set it to its amoutn value
    - If it does exist
      - Increment its value by the its amount value
4. Return the obj
*/

function processTransactions(items) {
  let itemTotals = {};

  items.forEach(item => {
    if (!itemTotals[item.category]) {
      itemTotals[item.category] = item.amount;
    } else {
      itemTotals[item.category] += item.amount;
    }
  });

  return itemTotals;
}

// javascript

const transactions = [
  { id: 1, amount: 50, category: 'food' },
  { id: 2, amount: 30, category: 'transportation' },
  { id: 3, amount: 20, category: 'food' },
];

console.log(processTransactions(transactions));
// Should return: { food: 70, transportation: 30 }
