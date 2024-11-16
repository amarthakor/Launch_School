// let i = 0;
// while (i < 10) {
//   if (i % 3 === 0) {
//     console.log(i);
//   } else {
//     i += 1;
//   }
// }

// will not output 3, 6 or 9 because loop will get stuck at i === 0 since
// i is not being incremented when the if clause executes.
// because (0 % 3 === 0) evaluates as true, the if branch executes
// skipping the else branch and never icnrementing i by 1