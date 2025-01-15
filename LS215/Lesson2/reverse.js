// Implement a function that takes a string as an argument and returns a new string that contains the original string in reverse.

function reverse(msg) {
  return msg.split(' ').map(word => word.split('').reverse().join('')).join(' ');
  // return msg.split('').reverse().join(''); ----> more streamlined solution
}

console.log(reverse('hello'));                  // returns "olleh")
console.log(reverse('The quick brown fox'))     // returns "xof nworb kciuq ehT"