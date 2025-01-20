// PROBLEM 1

// A distinct string is a string that is present only once in an array.

// Given an array of strings, arr, and an integer, k, return the kth distinct string present in arr. If there are fewer than k distinct strings, return an empty string "".

// Note that the result string is the one encountered earliest in the array.

// Example:
// distinctString(["d","b","c","b","c","a"], 2); // "a"

// What should we do if multiple arrays are provided?
// What should we do if an empty array is provided?
// Do we have to account for `arr` being a non-array value?
// What if multiple integer values are provided?
// What if no integer value is provided?

// CONSIDERATIONS MISSED
// Will the first argument always be an array? If not, how should I proceed?
// Will second argument always be an integer? If not, how to proceed?
// Will the second argument ever be `0`? If so, how to proceed?
// Will the second argument ever be a negative int? If so, how to proceed?
// Can the array be a sparse array? If so, how to handle missing elements?
// Can array contain any amount of elements?
// Will strings be one char long, or can they be any length?


// ---- PROBLEM 2 ----

// Given an array of integers, nums, return the third largest number in the array. If the third largest number does not exist, return the greatest number.

// You are not allowed to sort the array.

// Example:

// thirdMax([3, 2, 1]); // 1
// What happens if an empty array os provided?
// What happens if a non-array value is provided?
// What happens if an array with no integers are provided
// What happens if a sparse array is provided?
// What happens if an array with no integer elements is provided?

// CONSIDERATIONS MISSED
// What happens if more than one array argument is provided?
// What happens if an array with less than three elemnts is provided?
// Can the array contain any number of elements?
// Will the array every contain negative numbers or 0?
// Will the array ever contain `NaN`, `Infinity` or `-Infinity`?
// Can the numbers in the array appear in any order? Does this affect the result
//      in any way?
// Can the array have repeated numbers? If so how should that be handled?

// ---- PROBLEM 3 ----

// Write a function, primeNumberPrinter, that prints all prime numbers present as substrings in a given string.

// Example

// primeNumberPrinter("a4bc2k13d"); // [2, 13]

// What happens if an empty string is provided?
// Is the string char `-` signifying a negative number? If so, how should
//    negative numbers be treated?
// What happens if there are no prime numbers in the string provided?
// What if the string `inifity` or `-infinity` is provided in the text,
//    Should that be intepreted as a number or string?
//    If a number, how should they be handled?
// What happens if a nonstring value is provided?
// What happens if multiple strings arguments are passed?
// The problem says to print all prime numbers present in as substrings
//    in the string argument, but the return value is an array
//    Thus are we expected to return an array of all prime numbers
//    in the given string?
//    Or are the prime numbers expected to be printed out in an array?

// CONSIDERATIONS MISSED
// Should I return an empty array if the string doesnt contain any primes / digits?
// Can the string contain any number of chars?
// If the string has adjacent numbers, such as `ab123a1`, should that be treated
//    as [123, 1] or [1, 2, 3, 1]? Or maybe all possible number combinations
//    of multiple digits? I.E. `12, 23, 123`?
// Should hte numbers be listed in any partocular order?


// ---- PROBLEM 4 ----

// ​Write a function that takes a two-dimensional array as the argument and turns it into a flat array with all duplicated elements removed. Treat numbers and number strings (e.g., 1 and '1') as duplicates, and keep the one that comes first in the result.

// Examples

// flattenAndUnique([]); // []
// flattenAndUnique([[1, 2, 3], ['3', 4, 5, 'a']]); // [1, 2, 3, 4, 5, 'a']

// What happens if a non array value is provided?
// What happens if the two-dimensional array contains an inner nested array?
//    How should elements be that are duplicates be delt with within the inner nested array?
// What happens if more than one array argument is provided?
// 