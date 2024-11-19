function isPalindrome(word) {
  let lastIdx = word.length - 1

  for (idx = 0; idx < word.length; idx += 1) {
    if (word[idx] !== word[lastIdx]) return false;
    lastIdx -= 1;
  }

  return true;
}



console.log(isPalindrome('madam'));              // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));   // false (all characters matter)
console.log(isPalindrome('356653'));        // true