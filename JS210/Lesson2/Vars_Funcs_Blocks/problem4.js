let color1 = 'purple';
let color2 = 'pink';
let colors = ['red', 'green', 'blue'];

function updateColors(colors, color) {
  colors.push(color);
  return colors;
}

let newColors = updateColors(colors, color1);
updateColors(newColors, color2);
console.log(colors);

// new colors -> [red greem b;ie purple]
// mew cp;prs -> [red green blue purple pink]
// colors -> [red green blue purple pink]