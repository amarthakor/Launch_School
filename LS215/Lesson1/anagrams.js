function anagram(word, list) {
  let chars = word.split('').sort();
  let anagrams = [];

  list.forEach(item => {
    let sortedItem = item.split('').sort();
    if (chars.every((char, idx) => char === sortedItem[idx])) anagrams.push(item);
  });

  return anagrams;
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]