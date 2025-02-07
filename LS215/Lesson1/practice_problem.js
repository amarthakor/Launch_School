let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

// country should bet set to 'Canada' for all objs
// band name should have all words capitalized
// remove all '.' from band name

function processBands(data) {
  return data.map(band => {
    band.name = band.name.replace(/[.]/g, '');
    band.country = 'Canada';
    band.name = band.name.split(' ').map(word => word[0].toUpperCase() + word.slice(1)).join(' ');
    return band;
  });
}
console.log(bands);
console.log(processBands(bands));
console.log(bands);