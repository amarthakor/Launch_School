// Iterate thru array
// for each 2 element nested array, find teh area via h * w
// increment the total area variable
// return the total area variable

function totalArea(array) {
  let totalArea = 0;
  array.forEach(area => totalArea += area[0] * area[1]);
  return totalArea;
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
console.log(totalArea(rectangles));     // 141

function totalSquareArea(array) {
  let totalArea = 0;
  array.forEach(area => {
    if (area[0] === area[1]) totalArea += area[0] * area[1];
  });
  return totalArea;
}

console.log(totalSquareArea(rectangles));     // 141