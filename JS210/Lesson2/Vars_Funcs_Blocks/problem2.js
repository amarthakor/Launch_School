let color = 'yellow';
let colors = ['red', 'green', 'blue'];

function updateColors(colors, color) {
  colors.push(color);
}

updateColors(colors);
console.log(colors);

// [red, green, nlue] -> actually we push in undefined bc color param
// is not assigned to any value thus undefined gets appended