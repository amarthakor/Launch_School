function triangle(stars) {
  let spaces = stars - 1
  let star = stars - spaces;

  for (let counter = 1; counter <= stars; counter += 1) {
    console.log(`${' '.repeat(spaces)}${'*'.repeat(star)}`)
    spaces -= 1;
    star += 1;
  }
}



triangle(5);
triangle(9);