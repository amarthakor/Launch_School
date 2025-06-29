/*


Consider the function startCounter that accepts a callback. It should use setInterval to call the callback every second, incrementing and logging a counter variable each time. Also, provide a way for the callback to stop the counter after reaching a specified value.


*/

let id;

function startCounter(callback) {
  let count = 0;
 
  id = setInterval(() => {
    count++;
    let status = callback(count);
    if (status) clearInterval(id);
  }, 1000);
}

// Example usage:
startCounter((count) => {
  console.log(count);
  return count === 5;
});
// Logs 1, 2, 3, 4, 5, then stops