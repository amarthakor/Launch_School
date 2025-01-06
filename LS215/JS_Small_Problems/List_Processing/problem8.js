function buyFruit(array) {
  let results = [];

  array.forEach(pair => {
    for (let idx = 0; idx < pair[1]; idx += 1) {
      results.push(pair[0]);
    }
  })

  return results;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]