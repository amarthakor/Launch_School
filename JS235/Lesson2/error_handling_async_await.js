function fetchData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const data = Math.random();
      if (data > 0.5) {
        resolve(data);
      } else {
        reject(new Error ("Something went wrong"));
      }
    }, 2000);
  });
}

async function fetchAndLogData() {
  try {
    console.log("Fetching data...");
    let data = await fetchData();
    console.log(`Data received: ${data}`);
  } catch (error) {
    console.log("Catching...");
    console.error(`Error: ${error.message}`);
  }
}

fetchAndLogData();