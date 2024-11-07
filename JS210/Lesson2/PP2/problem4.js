function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    let a = 'hello again';
  }
}

hello();
console.log(a);