// 1.  ​Basic​: Write a function that takes an array of objects representing books (with properties for title, author, and year) and returns a new array containing only the titles of books published after 2000.

/*
-- PRoblem --
INPUT: array
OUTPUT: array

Rules:
  - Given ana rray of objects
    - Objects represent books
    - properties for title, author, and year
  - Return a new array containing only property titles 
    - where books are published after 2000

Assumptions:
- Will our given array always xonrin object literals as elements, or can it contain other elements?
  - No, it will only contain object literals, no other datat ypes as elements
- What if we are given a non array argument?
  - Return null
- What about additional arguments?
  - Ignore all additional arguments
- Will we ever be given a sparse array?
  - Will not be passed a sparse array as ana rgument
- Books published IN 2000 count or don't count?
  - They DO NOT count

-- Examples -- 
- Given an arrray of books
  - The Road, The martian, Project Haily mary

- Given an array of books
  - old book year is 1900
  - thus if all books are under 2000
  - return an empty array
  -> []

- Given 12345
  - Return null since invalid object

-- Data Structures --
- Array to iterate over each element which is an object
- Can transform or carry out other array abstraciton methods
- Maintain array DS

-- Algorithm --
1. Handle any null cases
2. Transform the given array into an array of title properties based on the above conditions
  - For each object in our books array
  - If the year property is > 2000
    - Transform the current element into its title property
  - Else
    - Move onto the next element (book object)
3. Return the transformed array of books
*/

function getRecentBookTitles(books) {
  if (!Array.isArray(books)) return null;
  let titles = [];

  books.forEach(book => {
    if (book.year > 2000) titles.push(book.title);
  });

  return titles;
}

// Test cases
const books = [
  { title: 'The Road', author: 'Cormac McCarthy', year: 2006 },
  { title: 'Pride and Prejudice', author: 'Jane Austen', year: 1813 },
  { title: 'Harry Potter', author: 'J.K. Rowling', year: 1997 },
  { title: 'The Martian', author: 'Andy Weir', year: 2011 },
  { title: 'Project Hail Mary', author: 'Andy Weir', year: 2021 }
];

console.log(getRecentBookTitles(books)); 
// ['The Road', 'The Martian', 'Project Hail Mary']
console.log(getRecentBookTitles([])); 
// []
console.log(getRecentBookTitles([{ title: 'Old Book', author: 'Someone', year: 1900 }])); 
// []
console.log(getRecentBookTitles(12345));