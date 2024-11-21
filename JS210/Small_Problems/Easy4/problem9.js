function countOccurrences(vehicles) {
  let vehicleCounts = {};

  for (let idx = 0; idx < vehicles.length; idx += 1) {
    if (vehicleCounts[vehicles[idx]]) {
      vehicleCounts[vehicles[idx]] += 1;
    } else {
      vehicleCounts[vehicles[idx]] = 1;
    }
  }

  for (let vehicle in vehicleCounts) {
    console.log(`${vehicle} => ${vehicleCounts[vehicle]}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
// suv => 1