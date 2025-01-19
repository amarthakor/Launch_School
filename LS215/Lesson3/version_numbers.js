// Write a function that takes any two version numbers in this format and compares them, with the result of this comparison showing whether the first is less than, equal to, or greater than the second version:

// If version1 > version2, we should return 1.
// If version1 < version2, we should return -1.
// If version1 === version2, we should return 0.
// If either version number contains characters other than digits and the . character, we should return null.

// Examples:
// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

/*
---- PROBLEM
- Input: two version numbers
- Output: return number designating version comparison
  - Return 1 if version1 is greater > than version2
  - Return -1 if version 2 is greater > than version 1
  - Return 0 if version1 is equal == to version2
  - Return null if either version number contains chars other than digits and `.`

- Rules:
  - Version are ordered/sorted from least to greatest
  - Versions can have multiple decimals

- Assumptions:
  - Is input in the form of numbers i.e. floats or strings?
    - Assume String since `1.2.0.0` is not a valid number and version number
      may contain chars other than digits and `.`, signifying string
  - What is the maximum length and minumum length version numbers will be?
    - Example, is 00000.1 a valid version number?
    - What about 0.0001 or 0.0.0.0.0.01?
    - What is the maximum amount of decimals we will have?
      - For example, 1.2.0.0 vs 1.2.0.0.0.0.0.0.0.0?
  - Assume a maximum of 3 decimal places and no multiple leading or trailing zeros

---- EXAMPLES
- 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
  - 0.1 < 1, thus we return -1 (0.1 is version1, 1 is v2)
  - 1 == 1.0, thus we return 0
  - 1.1 > 1, thus we return 1 (1.1 is v1, 1 is v2)
  - 1.2 == 1.2.0.0, thus we return 0
  - 1.2a, !.1.1, thus we return null since one or both version numbers have invalid chars

---- DATA STRUCTURES
- Since we are comparing strings, probably would be better to avoid
  any DS and maybe use REGEX to alter versions in a comparable format?

----- ALGORITHM
- CHECK if verions have any invalid chars
  - IF any version numbers have chars OTHER THAN digits or `.` ^REGEX
    - RETURN null;

- ALTER Version numbers so that they can be compared
  - Remove all secondary and more decimal values `.` via HELPER method

- RETURN 1, -1, or 0 based on comparison of two modified version numbers
  - If modified V1 is > modified V2
    - Return 1
  - If modified V1 is < modified V2
    - Return -1
  - If modified V1 is == modified V2
    - Return 0

HELPER METHOD for modifying versions into integers for comparison
  - SET some var, `decimalPresent`? to false
  - ITERATE over string
    - IF decimalPresent is true and current char is a decimal '.'
      - remove current char
    - IF current char is a decimal, set decimalPresent to true
  - Convert modified version number to number and return value

*/

function compareVersions(ver1, ver2) {
  if (/[^0-9.]/.test(ver1) || /[^0-9.]/.test(ver2)) return null;

  ver1 = modifyStrVersion(ver1);
  ver2 = modifyStrVersion(ver2);

  if (ver1 > ver2) return 1;
  if (ver2 > ver1) return -1;
  if (ver1 === ver2) return 0;
}

function modifyStrVersion(versionNum) {
  let decimalPresent = false;
  let newVersionNum = '';

  for (let idx = 0; idx < versionNum.length; idx += 1) {
    if (/[0-9]/.test(versionNum[idx])) newVersionNum += versionNum[idx];
    if (versionNum[idx] === '.' && decimalPresent === false) {
      newVersionNum += versionNum[idx];
      decimalPresent = true;
    }
  }

  return Number(newVersionNum);
}

// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
console.log(compareVersions('0.1', '1'));            // -1
console.log(compareVersions('1', '1.0'));            // 0
console.log(compareVersions('1.nadwe', '99'));       // null
console.log(compareVersions('1.2.0.0', '1.18.2'));   // 1
console.log(compareVersions('1.2', '1.2.0.0'));      // 0
console.log(compareVersions('13.37', '1.18.2'));     // 1