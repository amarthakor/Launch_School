function displayPop(population) {
  if (population < 0) return "Invalid, must enter population size greater than 0";
  for (population; population >= 0; population -= 1) {
    console.log(population);
  }
}

displayPop(5);

function populationCount(number) {
  if (number < 0) return;
  console.log(number);
  populationCount(number - 1);
}

populationCount(5);