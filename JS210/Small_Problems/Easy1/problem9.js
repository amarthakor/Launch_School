function multisum(number) {
  let factors = [];
  let totalSum = 0;

  findFactors(factors, number);
  factors.forEach((num) => totalSum += num)

  console.log(totalSum);
}

function findFactors(arr, num) {
  for (let currentNum = 1; currentNum <= num; currentNum += 1) {
    if (currentNum % 3 === 0 || currentNum % 5 === 0) {
      arr.push(currentNum);
    }
  }

  return arr;
}

multisum(3);       // 3
multisum(5);       // 8
multisum(10);      // 33
multisum(1000);    // 234168