// You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

// Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.
/*
----- PROBLEM ------
INPUT: Given an Integer
OUTPUT: Return an array of integers

Rules:
  - Given integer (n) represents a collection of 'light switches' from 1 to 'n'
  - Given integer (n) represents also indicates how many 'passess' will be done
  - All light switches are initially 'off'
    - On the first pass (1), all lights are toggled -- think multiples of 1 (1, 2, 3, 4...)
    - On the second pass (2), all multiples of 2 are toggled (2, 4, 6, 8...)
    - On the second pass (3), all multiples of 3 are toggled (3, 6, 9, 12 ...)
    - This process is repeated up to 'n' times
  - Once this process is completed, we return an array of all lights that are toggled
    in the 'on' position.

Assumptions:
  - What happens if a negative int / 0 / floating number is provided?
    - Assume only positive integer will be provided
  - What happens if multiple positive integers are provided?
    - Assume only one integer will be provided
  - What happens if a noninteger argument is provided?
    - Return NULL

------ EXAMPLES -----
- lightOn(5) => [1, 4]
  - Pass 1 => [1, 2, 3, 4, 5]
    - All switches are off initially
    - Toggle all switches of mulitples of 1, thus all switches get turned on

  - pass 2 => [1, 3, 5]
    - Toggle switches of multiples of 2 upto 'n' or 5 => (2, 4)
    - This turns 'off' (2, 4) thus we remove it from our 'on' lights
    - Results in [1, 3, 5];

  - pass 3 => [1, 5]
    - Toggle switches of multiples of 3 upto 'n' or 5 => (3)
    - This turns 'off' (3), thus we remove it from our 'on' lights
    - => [1, 5];

  - pass 4 => [1, 4, 5]
    - Toggle switches of multiples of 4 upto 5 => (4)
    - This turns 'on' (4), thus we 'add' it to our on lights since it does not exist in
      the current collection of [1, 5]
    - => [1, 4, 5]

  - pass 5 => [1, 4]
    - Toggle switches of multiples of 5 upto 5 => (5)
    - This turns 'off' switches (5), thus we remove it frmo our 'on' lights
    - => [1, 4] as the only 'on' lights

- lightsOn('hi') => return null
- lightsOn([1]) => return null
- lightsOn(1) => [1]
-- **** IMPORTANT TO NOTE THAT IF THE LIGHT EXISTS IN THE COLLECTION
        - REMOVE IT
        IF IT DOESN'T EXIST IN THE COLLECTION OF 'ON' LIGHTS
        - ADD IT TO THE COLLECTION
    - This way we can determine which multiples are being removed and which are
      being added rather than simply adding / removing all multiples of a given number

----- DATA STRUCTURES ------
- Since we are returning an array, arrays wll be used
- Also optimal to allow iteration over collection
- Will probably need nested iteration to iterate upto `n` integer

----- ALGORITHM -----
- RETURN null if the given argument is not an integer type
  - Check argument type and cont if true, return null if not

- CREATE an array of integers from 1 to `n`
  - Loop thru to create array of ints from 1 to 'n'

- TOGGLE switches `on` or `off`
  - Iterate upto `switches` times
  - For each iteration
    - Iterate again (nested loop) from the current light upto `switches` times
    - If the current light multiple (denoted by first iteration) is a multiple of the current
      iteration value in the nested loop && AND exists in the collection
        - Remove it from the collection
    - If the current light (denoted from the first iteration) is a multiple of the current
      iteration value in the nested loop && DOES NOT exist in the collection
        - Add it to the collection

- RETURN array of integers that are all left `on`
  - return `lights`

*/

function lightsOn(switches) {
  if (typeof switches !== 'number') return null;
  let lights = allLightsOn(switches);

  for (let round = 2; round <= switches; round += 1) {
    for (let light = round; light <= switches; light += 1) {
      if (light % round === 0 && !lights.includes(light)) {
        lights.push(light);
      } else if (light % round === 0 && lights.includes(light)) {
        lightIdx = lights.indexOf(light);
        lights.splice(lightIdx, 1);
      }
    }
  }

  return lights;
}

function allLightsOn(switches) {
  let numbers = [];
  for (let light = 1; light <= switches; light += 1) {
    numbers.push(light);
  }

  return numbers;
}



// Examples:
console.log(lightsOn(5));         // [1, 4]
console.log(lightsOn(100));       // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
console.log(lightsOn('hi'));      // return null
console.log(lightsOn([1]));       // return null
console.log(lightsOn(1));         // [1]