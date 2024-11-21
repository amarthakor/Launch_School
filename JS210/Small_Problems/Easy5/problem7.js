function swapName(fullName) {
  return fullName.split(' ').reverse().join(', ');
}

console.log(swapName('Joe Roberts'));    // "Roberts, Joe"