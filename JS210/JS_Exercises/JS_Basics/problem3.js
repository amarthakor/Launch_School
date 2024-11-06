// One of the ways to manage the flow of a program is through the use of conditionals.
// Go over the code below and specify how many unique execution paths are possible.

if (condition1) {
  // ...
  if (condition2) {
    // ...
  } else {
    // ...
  }
} else {
  // ...
  if (condition4) {
    // ...
    if (condition5) {
    // ...
    }
  }
}

// 5 not 6 because the else block only contains if conditionals and no automatic 'else'
// thus we could execute some code in the else, while ignoring the two ifs (conditions 4/5)
// and therefore we have 3 branches in the else 'route' and 2 in the 'if' route