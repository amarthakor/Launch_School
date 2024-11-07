console.log(a);

function hello() {
  a = 1;
}

// raises error bc hello() is not invoked, thus a is never assigned a value
// and also never declared anywhere