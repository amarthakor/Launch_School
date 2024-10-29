let objToCopy = {
  foo: 1,
  bar: 2,
  qux: 3,
};

function copyObj(hash, array=undefined) {
  if (array === undefined) {
    return hash;
  }

  let copiedObj = {}

  array.forEach((key) => {
    if (hash[key]) {
      return copiedObj[key] = hash[key];
    }
  })

  return copiedObj;
}

let newObj = copyObj(objToCopy);
console.log(newObj);

let newObj2 = copyObj(objToCopy, [ 'foo', 'qux' ]);
console.log(newObj2);       // => { foo: 1, qux: 3 }

let newObj3 = copyObj(objToCopy, [ 'bar' ]);
console.log(newObj3);       // => { bar: 2 }