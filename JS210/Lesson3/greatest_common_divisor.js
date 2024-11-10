function gcd(num1, num2) {
  let factors = [];
  let min = [num1, num2].sort()[0];
  let max = [num1, num2].sort()[1];
  
  for (let currentNum = 1; currentNum <= max; currentNum += 1) {
    if (num1 % currentNum === 0 && num2 % currentNum  === 0) {
      factors.push(currentNum);
    }
  }

  console.log(factors[factors.length - 1]);
  return factors[factors.length - 1];
}

gcd(12, 4);   // 4
gcd(15, 10);  // 5
gcd(9, 2);    // 1