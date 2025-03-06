// Question 3: Balanced Parentheses (Advanced)
// Problem​: Write a function that determines if a string has balanced parentheses. A string has balanced parentheses if every opening parenthesis has a matching closing parenthesis in the correct order.

/*
-- Problem --
INPUT: String
OUTPUT: boolean

Rules:
  - Given a string argument
    - Determine if my string has balanced parentheses
    - Waht does balanced parantheses mean?
      - Balanced Parantheses means every opening para has a closing para in the correct order
    - What does correct order mean?
      - Every closing par must be preceded by an opening par such that the total
        amout of opening and closings Pars are equal
      - If there are more closing pars than opening pars from left to right, then
        the stirng is not balanced and return false

Assumptions:
- What happens if our string contains no paras?
  - Return false
- Will we ever be given non para characters?
  - Possibly
- How should we handle non string arguments
  - Return null
- How should we handle additionala rgs?
  - Ignore addiitonal arguments

-- Examples --
- Given '()'
  - Opening par = 1, closing par = 1
  -> true

- Given ')('
  - Opening par = 1, closing par = 1
  -> false
  - closing par comes before opening par
  - Thus we can assume that if a closing par precedes an opening par, we return false

- Given (balanced_parentheses("(()))("))
  - Paranthesis count = 0 # positive references more open negative references more closed
    - count + 1 ( -> 1
    - count + 1 ( -> 2
    - count - 1 ) -> 1
    - count - 1 ) -> 0
    - count - 1 ) -> -1
    because closing comes before opening we return false
  
-- DS --
- for loop to iterate over string

-- Algorithm --
1. Handle invalid cases
2. Create a `balancedPars` and set it to 0
3. Loop over my string
  - For each char
    - If the char is an opening par
      - Increment balancedPars by + 1
    - If the char is a closing par
      - Decrement balanced Pars by -1
    - If balancedPars is less than 0
      - Return false
4. If balancedPars === 0
    - return true
  - otherwise
    - return false
*/

function balanced_parentheses(str) {
  if (typeof str !== 'string') return null;

  let balancedPars = 0;

  for (let idx = 0; idx < str.length; idx += 1) {
    if (str[idx] === '(') balancedPars += 1;
    if (str[idx] === ')') balancedPars -= 1;
    if (balancedPars < 0) return false;
  }

  return balancedPars === 0;
}


console.log(balanced_parentheses("()") === true);
console.log(balanced_parentheses("(())") === true);
console.log(balanced_parentheses("(())()") === true);
console.log(balanced_parentheses(")(") === false);
console.log(balanced_parentheses("(()") === false);
console.log(balanced_parentheses("(()))(") === false);

// javascript

// Edge case: Empty string (should return true as it has 0 opening and 0 closing parentheses)
console.log(balanced_parentheses("") === true);

// Edge case: String with no parentheses (should return true)
console.log(balanced_parentheses("hello world") === true);

// Edge case: Non-string argument (you mentioned returning null, but don't have this check)
console.log(balanced_parentheses(123) === null);

// Edge case: String with nested parentheses
console.log(balanced_parentheses("(((())))") === true);

// Edge case: String with mixed content
console.log(balanced_parentheses("hello (world)") === true);

// Edge case: Multiple unbalanced sections
console.log(balanced_parentheses(")()(") === false);

// Edge case: Deeply nested with unbalanced ending
console.log(balanced_parentheses("(((()))") === false);