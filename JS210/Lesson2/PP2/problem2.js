function say() {
  if (false) {
    let a = 'hello from inside a block';
  }

  console.log(a);
}

say();

// error a is undefined