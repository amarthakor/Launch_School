// Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

/*
---- PROBLEM
INPUT: integer argument
OUTPut: an array of integers

Rules:
  - Always given one argument; an integer
  - Return array is filled with integer elements
    - These elements represent the lights that are left on after `n` repetitions
    -`n` repetitions means we will `toggle` the lights on and off `n` amount of times
      where `n` is equal to the integer argument

Assumptions:
  - How should we handle 0, negative, and other special number arguments?
    - Return null
  - How should we handle non integer arguments
    - Return null
  - How should we handle additional arguments?
    - Ignore additional arguments
  - Is there an upper limit to the integer passed as an argument?
    - There is not

---- EXAMPLES
  - lightsOn(5)
  - will perform `5` passes toggling the lights on/off
  - light switches are from 1..`n`, so [1, 2, 3, 4, 5]
  - 5 passes:
    1. [1, 2, 3, 4, 5] - toggle all lights that are multiples of 1
    2. [1, 3, 5]       - toggling all lights that are multiples of 2; turn off/remove 2 and 4
    3. [1, 5]          - toggle all lights that are multipels of 3; turn off /remove 3
    4. [1, 4, 5]       - toggle all lights multiples of 4; add 4 since it is not in our collection
                         of 'on' lights
    5. [1, 4]           - toggle all mults of 5; remove 5 as it exists in our collection
  -> [1, 4] remain, so this is our return

- lightsOn(10);      // 
  - will perform 10 passes:
    1. pass 1: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - toggle mults of 1 upto 10 inclusive
    2. [1, 3, 5, 7, 9]  - toggle mults of 2(2, 4, 6, 8) if they exist remove them if they dont add them ****
    3. [1, 5, 6, 7, ]  - toggle mults of 3 (3, 6, 9) removed 3, added 6, 9
    4. [1, 4, 5, 6, 7, 8, ]  - mults of 4 (4, 8) added 4, 8
    5. [1, 4, 8, 6, 7, , 10] - mults of 5 = 5, 10 || remooved 5, added 10
    6. [1, 4, 7, 8, , 10 ] - mults of 6 = 6; remove 6
    7. [1, 4, 8, , 10] - mults of 7 = 7, remove 7
    8. [1, 4, , 10] -mults of 8 = 8, remove 8
    9. [1, 4, 9, 10]     - mults of 9 = 9, removed 9
    10. [1, 4, 9] - mults of 10 = 10 remove 10

- lightsOn([]);       // null
- lightsOn(0); // null
- lightsOn(NaN); //null
- lightsOn(Infinity); //null
- lightsOn(5, 10); // [1, 4]
- lightsOn(-5); // null

---- DATA STRUCTURES
- need to return an array
- need to iterate `n` times and probably perform a nested iteration
- array would be ideal choice

---- ALGORITHM
1. Return null for invalid conditions
  - if x == y return null

2. Create an array of all lights turned on after the first pass -- 1..`n`
  - for loop to add in all lights from 1 including upto `n`
3. Toggle lights on/off `n` amount of times ** helper method **
4. Return an array of the remaining lights that are left on


helper method: toggleLights
1. For each pass from 2..`n`
  - toggle all multiples of the current num upto `n`
    - for the current multiple
      - if the light is 'on' or exists in the array and is multiple of `n`
        - remove it
      - if the light is 'off' or doesnt exist in the array and is multiple of `n`
        - add the multiple
2. return the array
*/



function lightsOn(switches) {
  if (!(Number.isInteger(switches))) return null;
  if (switches < 1) return null;
  let lights = [];
  for (let num = 1; num <= switches; num += 1) {
    lights.push(num);
  }

  lights = toggleLights(lights);

  return lights;
}

function toggleLights(lights) {
  let max_round = lights.length
  for (let round = 2; round <= max_round; round += 1) {
    for (let multiple = round; multiple <= max_round; multiple += 1) {
      if (lights.includes(multiple) && multiple % round === 0) {
        lights = lights.filter(light => light !== multiple);
      } else if (!lights.includes(multiple) && multiple % round === 0) {
        lights.push(multiple);
      }
    }
  }

  return lights;
}

// console.log(toggleLights([1, 2, 3, 4, 5]));

console.log(lightsOn(5));        // 
// // [1, 4]
// // Detailed result of each round for `5` lights
// // Round 1: all lights are on
// // Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// // Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// // Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// // Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
console.log(lightsOn([]));       // null
console.log(lightsOn(0)); // null
console.log(lightsOn(NaN)); //null
console.log(lightsOn(Infinity)); //null
console.log(lightsOn(5, 10)); // [1, 4]
console.log(lightsOn(-5)); // null