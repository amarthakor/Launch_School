function incrementProperty(obj, str) {

  if (Object.keys(obj).includes(str)) {
    obj[str] += 1;
    return obj[str];
  } else {
    obj[str] = 1;
    return obj[str];
  }
}

let wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }