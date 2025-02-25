// 3.  Balanced Parentheses:
// Write a function that takes a string containing only parentheses and returns true if the parentheses are balanced, false otherwise.

/*
---- PROBLEM
INPUT: string
OUTPUT: boolean, true or false

Rules:
  - Return true if parentheses are balaned
    - What does 'balanced' mean?
      - Amount of ( and ) are equal to each other
  - If parenthesis are not balanced
    - Return false

Assumptions:
  - How should we treat non string type arguments
    - Return null
  - Will our strings every contain non-paranthetical chars?
    - They may
  - How should we handle multiple args?
    - Ignore any additional arg
  - How should we handle empty string args?
    - Return false

---- EXAMPELS
balanced("()")); // === true
  - Given string ()
    - 1 (, 1 ) 1 == 1 true

balanced("(())"));// === true
  - Given (())
    - (: 2, ): 2; 2 == 2 true

balanced("(()())"));// === true
  - Give (()())
    - 3 (, 3 ); 3 === 3 true

balanced("((()"));// === false
  - Given ((();
    - 3(, 1);  3 !== 1 false

balanced(")("));// === false
  - Given )(
    - 1(, 1) 1 == 1 true, but answer is false
    - We must have an open '(' precede every closed ')'
    - If an ')' appears in our string that isn't matched with a preceding '(',
      then we must return false as they are not 'nalanced'

balanced("())("));// === false
  - Given ())(
    - 2 open 2 close, but 
    - 2nd ) appears before 2nd (, violates balancing rule, return false
//

balanced(""); // === false
   - Given "", immediately return false

balanced(1);  // === null
  - Given non string, return null

balanced("()", "()"); // ===true
  - Given (), but w/ additional arg
    - Ignore all additional args
  - 1 opening (, 1 closing ) 1==1
  - still balnced -> return true

balanced("(  )"); // === true
  - "(  )" === "()" --> true

balanced("(ab)"); // === true
  - "(ab)" === "()" --> true

balanced("((1))"); // === true
  - "((1))" === "(())" -> true

balanced("(1() (b) 1)"); // === true
  - '(1() (b) 1)' -> '(()()) === true

---- DATA STRUCTURES
- dont need any key value pairings
- if need to simply iterate over every char, array might be useful
  - but i can also just use for loop

---- ALGORITHM
1. Handle empty strings / non string args
  - if string === '' return false, return null if string is not a string

2. Check each char in string to see if its balanced
  - For each char
    - If the char is an opening parantheses
      - Increment a counter by 1
    - If the string is a cclosing parantheses
      - Decrement the counter by 1
    - If the counter ever is less than 0
      - Return false
3. Return true
*/

function balanced(msg) {
  if (typeof msg !== 'string') return null;
  if (msg === '') return false;
  let balanced = 0;

  for (let i = 0; i < msg.length; i += 1) {
    if (msg[i] === '(') balanced += 1;
    if (msg[i] === ')') balanced -= 1;
    if (balanced < 0) return false;
  }

  return balanced === 0;
}

console.log(balanced("()")); // === true
console.log(balanced("(())"));// === true
console.log(balanced("(()())"));// === true
console.log(balanced("((()"));// === false
console.log(balanced(")("));// === false
console.log(balanced("())("));// === false

// extra cases

console.log(balanced("")); // === false
console.log(balanced(1));  // === null
console.log(balanced("()", "()")); // ===true
console.log(balanced("(  )")); // === true
console.log(balanced("(ab)")); // === true
console.log(balanced("((1))")); // === true
console.log(balanced("(1() (b) 1)")); // === true
console.log(balanced("(1() (b) 1)!)")); // === false

console.log(balanced("((()))")); // === true
console.log(balanced("(()()()())")); // === true
console.log(balanced("(()()((()())))")); // === true
console.log(balanced("((()())())")); // === true
console.log(balanced("(()(())((())))")); // === true

console.log(balanced("(()")); // === false
console.log(balanced(")()(")); // === false
console.log(balanced("())")); // === false
console.log(balanced("((())")); // === false
console.log(balanced("(()))")); // === false

console.log(balanced("(hello (world))")); // === true
console.log(balanced("(a(b(c)d)e)")); // === true
console.log(balanced("((()))(())()()(()())")); // === true
console.log(balanced("(((())))(())()()(()())")); // === false

console.log(balanced("(   )")); // === true
console.log(balanced("(  ( )  )")); // === true
console.log(balanced("(  ( (  ) )  )")); // === true

console.log(balanced("()()()()()()()")); // === true
console.log(balanced("(()()()()()())")); // === true

console.log(balanced("((()())())((())()())")); // === true
console.log(balanced("((()())())((())()()))")); // === false

console.log(balanced("(abc(def)ghi)jkl")); // === true
console.log(balanced("(abc(def)ghi))jkl")); // === false

console.log(balanced("(()())(()()())(()()()())")); // === true
console.log(balanced("(()())(()()())((()()()())")); // === false