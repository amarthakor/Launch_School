/*
Imagine you're a pet owner wanting to give treats to your pets. Each pet has a specific appetite level represented by an array appetite[i], which is the minimum size of a treat the pet will be happy with. Each treat has a size represented by an array treats[j]. A pet will be satisfied if the size of the treat treats[j] is greater than or equal to its appetite level appetite[i]. Your goal is to maximize the number of satisfied pets and output the number of satisfied pets in the end.

--- Problem
INPUT: two arrays
OUTPUT: integer

  Rules:
  - Given an array of integers and a second array of integers
    - first array represents a `pets` MINIMUM value of treats they want
    - second array represents the `amount` of treats available
  - a pet will be happy if the size of treats in arr2 is >= their own appetite level arr1
  - the number of satisfied pets i can have is equal to the length of arr2 (assuming that all amount treat sizes satisfies the pets in array1)
    - thus if arr2 size < arr1 size
      - we can only have a maximum amount of happy pets === arr2 size

Assumptions:
- always be given array arguments
- elements w/n arrays will always postive integers
- if either arr1 or arr2 === []
  - return 0

--- Examples
Given ([3, 4, 2], [1, 2, 3])) -> return 2
  - pet1 -> 3 === 3
  - pet2 -> 4 !== 1
  - pet3 -> 2 === 2
  2pets

Given ([1, 2, 3], [3]) -> return 1
  pet1 -> 1 <= 3
  pet2 -> 2
  pet3 -> 3
  1pet

Given [1, 5], [5, 5, 6])
  -pet1 -> 1 5
  pet2 -> 5 5
  2pets


--- DS
- sort help compare my pets to appetite satisfaction lvls

--- Algorithm
1. Return 0 if either arr1 or arr2 are empty
2. Set `happyPet` to 0
3. Find all happyPets
- sort both arrays
- set `pet` to 0 #anchor
- set `treats` to 0 # runner
  - while treats < array2 size
  - if arr1[pet] <= arr2[treats]
    - happyPet +1
    - pet +1
    - treats +1
  - else
    - treats += 1

4. return happypets
*/

function assignTreats(pets, treats) {
  if (pets.length === 0 || treats.length === 0) return 0;
  let [happyPet, pet, treat] = [0, 0, 0];
  pets.sort((a, b) => a- b), treats.sort((a, b) => a- b);

  while (treat < treats.length) {
    if (pets[pet] <= treats[treat]) {
      happyPet +=1;
      pet +=1;
      treat += 1;
    } else {
      treat += 1;
    }
  }
  
  return happyPet;
}

console.log(assignTreats([3, 4, 2], [1, 2, 3]));// === 2);
console.log(assignTreats([3, 4, 2], [1, 2, 3]) === 2);
console.log(assignTreats([1, 5], [5, 5, 6]) === 2);
console.log(assignTreats([1, 2, 3], [3]) === 1);
console.log(assignTreats([2], [1, 2, 1, 1]) === 1);
console.log(assignTreats([4, 3, 1], [2, 1, 3]) === 2);
console.log(assignTreats([1,2,3], [1,2,3]) === 3);
console.log(assignTreats([4, 5, 6], [1,2,3]) === 0);

// All test cases should log true.