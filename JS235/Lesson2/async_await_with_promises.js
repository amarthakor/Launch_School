function fetchData(data, delay) {
  console.log("Fetching data...");
  return new Promise(resolve => setTimeout(() => {
    console.log(`Resolved promise with data: ${data}`);
    resolve(data);
  }, delay));
}


// function fetchAll() {
//   const promise1 = fetchData('foo', 1500);
//   const promise2 = fetchData(42, 500);
//   const promise3 = fetchData('Hello, world!', 2300);

//   Promise.all([promise1, promise2, promise3])
//     .then(values => {
//       console.log(`Promise.all succeeded: ${values}`);  // Promise.all succeeded: foo,42,Hello, world!
//     });
// }

async function fetchAll() {
  const dataItems = ['foo', 42, 'Hello, world!'];
  const delays = [1500, 500, 2300];

  try {
    const promises = dataItems.map((data, idx) => fetchData(data, delays[idx]));
    const results = await Promise.all(promises);
    console.log(`All data fetched: ${results}`);
  } catch (error) {
    console.error(error);
  }
}

fetchAll();