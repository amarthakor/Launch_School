/*


Update retryOperation to use async / await:

function retryOperation(operationFunc) {
  let attempts = 0;

  function attempt() {
    return operationFunc().catch((err) => {
      if (attempts < 2) {
        attempts++;
        console.log(`Retry attempt #${attempts}`);
        return attempt();
      } else {
        throw err;
      }
    });
  }

  return attempt().catch(() => console.error("Operation failed"));
}

*/

async function retryOperation(operationFunc) {
  let attempts = 0;

  async function attempt() {
    try {
      return await operationFunc();
    } catch (error) {
      if (attempts < 2) {
        attempts++;
        console.log(`Retry attempt #${attempts}`);
        return attempt();
      } else {
        throw error;
      }
    }
  }

  try {
    return attempt();
  } catch {
    console.log('Operaiton failed');
  }
}
