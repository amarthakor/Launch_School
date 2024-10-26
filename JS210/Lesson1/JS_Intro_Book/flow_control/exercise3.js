function evenOrOdd(number) {
  if (typeof(number) !== 'number') {
    console.log('Must enter a number');
    return;
  } else if (number % 2 === 0) {
    console.log('even');
  } else {
    console.log('odd');
  }
}

evenOrOdd('hi');
evenOrOdd([1, 2, 3]);
evenOrOdd(5);
evenOrOdd(6);