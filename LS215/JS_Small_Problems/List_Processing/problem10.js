function transactionsFor(number, list) {
  let results = [];

  list.forEach(item => {
    if (item.id === number) results.push(item);
  })

  return results;
}

function isItemAvailable(number, list) {
  let results = transactionsFor(number, list);
  let total = 0;

  results.forEach(item => {
    if (item.movement === 'in') total += item.quantity;
    if (item.movement === 'out') total -= item.quantity;
  });

  return total > 0;
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
  { id: 105, movement: 'in',  quantity: 10 },
  { id: 102, movement: 'out', quantity: 17 },
  { id: 101, movement: 'in',  quantity: 12 },
  { id: 103, movement: 'out', quantity: 15 },
  { id: 102, movement: 'out', quantity: 15 },
  { id: 105, movement: 'in',  quantity: 25 },
  { id: 101, movement: 'out', quantity: 18 },
  { id: 102, movement: 'in',  quantity: 22 },
  { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true