// 4.  Combined String and Array Problem:
//    Implement a function that takes a string of words separated by spaces and returns an array of words, sorted by the number of distinct characters in each word. If two words have the same number of distinct characters, maintain their relative order in the original string.


console.log(JSON.stringify(sortByDistinctChars("the quick brown fox jumps over the lazy dog")) ===
            JSON.stringify(["the", "the", "dog", "fox", "over", "lazy", "quick", "jumps", "brown"]));
console.log(JSON.stringify(sortByDistinctChars("hello world")) === 
            JSON.stringify(["hello", "world"]));
console.log(JSON.stringify(sortByDistinctChars("aaabbbcccdddeeefff")) === 
            JSON.stringify(["aaabbbcccdddeeefff"]));
console.log(JSON.stringify(sortByDistinctChars("")) === 
            JSON.stringify([]));
console.log(JSON.stringify(sortByDistinctChars("a b c d e f")) === 
            JSON.stringify(["a", "b", "c", "d", "e", "f"]));