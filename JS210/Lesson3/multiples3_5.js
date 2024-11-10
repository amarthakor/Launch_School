function multiplesOfThreeAndFive() {
  for (let currentNum = 1; currentNum <= 100; currentNum += 1) {
    if (currentNum % 3 === 0 && currentNum % 5 === 0) {
      console.log(`'${currentNum}!'`);
    } else if (currentNum % 3 === 0 || currentNum % 5 === 0) {
      console.log(`'${currentNum}'`)
    }
  }
}

multiplesOfThreeAndFive();