// function p(str) {
//   console.log(str.match(/^c.t/ig));
// }

// p("cat")          // [ 'cat' ]
// p("cot\n")        // [ 'cot' ]
// p("CATASTROPHE")  // [ 'CAT' ]
// p("WILDCAUGHT")   // null
// p("wildcat\n")    // null
// p("-CET-")        // null
// p("Yacht")        // null
// p("CzT")

// console.log('-----------------------------------');

// function p(str) {
//   console.log(str.match(/c.t$/mig));
// }

// p("cat")          // [ 'cat' ]
// p("cot\n")        // null
// p("CATASTROPHE")  // null
// p("WILDCAUGHT")   // null
// p("wildcat\n")    // null
// p("-CET-")        // null
// p("Yacht")        // [ 'cht' ]

// console.log('-----------------------------------');

function p(str, regex) {
  console.log(str.match(regex));
}

let text = "cat\ncot\nCATASTROPHE\nWILDCAUGHT\n" +
           "wildcat\n-GET-\nYacht"

p(text, /^c.t/mig) // [ 'cat', 'cot', 'CAT' ]
p(text, /c.t$/mig) // [ 'cat', 'cot', 'cat', 'cht' ]