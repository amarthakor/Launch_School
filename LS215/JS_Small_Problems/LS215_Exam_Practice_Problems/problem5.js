/*
----- PROBLEM
INPUT: integer
OUTPUT: array of integers

Rules:
  - Given one argument, an integer
  - Return array of integers represents the lights that are 'toggled on' after `n` passes
  - Perform `n` passes, where `n` is equivalent to the integer passed
  - Thus if given 5
    - Have 5 light switches from 1...5
    - Need to make 5 passes

Assumptions:
  - Will I be given any non integer arguments?
    - Assume all arguments will be number values
  - What about special number values such as floats, 0, negative nums, Infinity, etc.?
    - All arguments will be positive integer values
  - How should I handle non integer values?
    - Return NULL
  - What about being passed multiple arguments?
    - Ignore all argus besides the first arg passed


----- EXAMPLES
- lightsOn(5)
  - Have '5' light switches
  - Need to make '5' passes
    - Pass 1: [1, 2, 3, 4, 5] Toggle all switches multiples of 1
    - Pass 2: [1, 3, 5] Toggle all switches multiples of 2 ( 2, 4)
    - Pass 3: [1, 5] Toggle all swirches mukltiples of 3 (3)
    - Pass 4: [1, 4, 5] Toggle all switches multiples of 4 (4)
    - Pass 5: [1, 4] Toggle all switches multiples of 5 (5)

- lightsOn('hello world') === null

- lightsOn(5, 4, 3, 2, 1) === [1, 4]

----- DATA STRUCTURES
Using arrays will allow us to iterate over an ordered list of integers

----- ALGORITHM
- CREATE an array of all light switches
  - for loop 1..`n`
- PERFORM `n` passes and toggle the respective switches on each pass *HELPER METHOD
- RETURN the array of remaining lights left on

--- HELPER FUNC
CREATE a function to perform `passes` and adjust the arrays of lights as needed

Given an array of lights from 1..`n`
- PASS thru the array `n` amount of times
  - FOR each pass
    - CHECK all lights from 1..n
    - IF the current `pass` or its multiple exist in the array
      - REMOVE IT ( slice out the current idx and reassign the var)
    - Otherwise if it does NOT exist
      - Add it to the array

*/



function lightsOn(switches) {
  if (typeof switches !== 'number') return null;
  let allLights = Array.from(new Array(switches)).map((_, idx) => idx + 1);
  allLights = toggleLights(allLights);
  return allLights;
}

function toggleLights(lights) {
  rounds = lights.length;

  for (let idx = 2; idx <= rounds; idx += 1) {
    for (let jdx = idx; jdx <= rounds; jdx += 1) {
      if (jdx % idx === 0 && lights.includes(jdx)) {
        let lightIdx = lights.indexOf(jdx);
        lights.splice(lightIdx, 1);
      } else if (jdx % idx === 0 && !lights.includes(jdx)) {
        lights.push(jdx);
      }
    }
  }

  return lights;
}

// console.log(toggleLights([1, 2, 3, 4, 5]));
console.log(lightsOn(5));                                 // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));                               // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
console.log(lightsOn('hello world'));                     // === null
console.log(lightsOn(5, 4, 3, 2, 1));                     // === [1, 4]