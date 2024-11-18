const languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages); // ['javscript', 'ruby', 'yptipon];
console.log(languages.length); // 3

languages.length = 4;
console.log(languages); // ['JS', 'Rb', 'pyt' empty slot x1]
console.log(languages.length); // 4

languages.length = 1;
console.log(languages); // ['JS']
console.log(languages.length); // 1

languages.length = 3;
console.log(languages); // ['JS', 2x empty slot]
console.log(languages.length); // 3

languages.length = 1;
languages[2] = 'Python';
console.log(languages); // ['js', empty slot, 'python']
console.log(languages[1]); // undefined
console.log(languages.length); // 3