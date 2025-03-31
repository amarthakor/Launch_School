// Write a function `areMatched` that takes a string as an argument
// and returns true if all types of brackets (parentheses (),
// square brackets [], and curly braces {}) in the string are
// properly matched. For the brackets to be considered
// matched, every opening bracket must have a corresponding
// closing bracket of the same type, and the brackets must be
// correctly nested.

function areMatched(str) {
  let stack = [];
  for (let i = 0; i < str.length; i++) {
    // console.log(stack);
    if (/[[{(]/.test(str[i])) {
      stack.push(str[i]);
    } else {
      const popped = stack.pop();
      if ((str[i] === ')' && popped !== '(') ||
          (str[i] === '}' && popped !== '{') ||
          (str[i] === ']' && popped !== '[')) {
        return false;
      }
    }
  }

  return stack.length === 0;
}

console.log(areMatched("()"));              // Output: true
console.log(areMatched("([()]{})"));        // Output: true
console.log(areMatched("([((}]({}))"));     // Output: false
console.log(areMatched("{{[[(())]]}}"));    // Output: true
console.log(areMatched(""));                // Output: true
console.log(areMatched("([)]"));            // Output: false