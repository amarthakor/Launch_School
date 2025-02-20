// Problem: Longest Palindromic Substring
// Write a function that takes a string as an input and returns the longest palindromic substring within that string. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward, ignoring spaces, punctuation, and capitalization.
// If there are multiple palindromic substrings with the same maximum length, return the first one that appears in the string.


console.log(longestPalindrome("babad")); // Should output: "bab" or "aba"
console.log(longestPalindrome("cbbd")); // Should output: "bb"
console.log(longestPalindrome("a")); // Should output: "a"
console.log(longestPalindrome("ac")); // Should output: "a"
console.log(longestPalindrome("racecar")); // Should output: "racecar"
console.log(longestPalindrome("Hello, World!")); // Should output: "ll"