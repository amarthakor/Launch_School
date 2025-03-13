// 3.  ​Intermediate​: Write a function that takes an array of objects representing students (with properties for name, scores, and courses) and returns an object where each key is a course name and its value is the average score of all students in that course.

/*
start time 6:34pm
finish time shitty version 7:06 - 32mins
finish time after revisions
-- problem --
INPUT: array
OUTPUT: object 

Rules:
  - Given an array objects representing students
    - properties for name, scores, and courses
  - Return an object
    - each key is a class name
    - each value is the average score of all students in that course

Assumptions:
- Will we always be given ana rray argument?
  - If not given array, return null
- Will the elements within the array always be objects?
  - Yes, they will alwaus be obejct literals
- Hows to handle empty or sparse arrays?
  - Return empty obj for empty arrays
  - Will never be given a sprase array
- How to handle additional args?
  - Ignore additional arguments
- Should avg score be floats or integers and if floats, rounded at all?
  - floats no rounding necessary

-- Examples --
- Given an array of objs of students, return an obj of each class and its avg score
  - math, english, history, science
  - math -> 95 + 70 + 80 / 3
  - english -> 80 + 85 / 2
  - history -> 92 + 75 / 2
  - sciecne -> 90 / 1
  ----
  -> { math: 81.66666667, english: 82.5, history: 83:5, sceince: 90 }

-- Data Structure --
- given an array
- return an object
- stick to using arrays to iterate thru my students
- utilize both ds to obtain result

-- Algorithm --
1. handle null cases
2. Create an obj of all unique classes as keys and an array as values
3. For each unique class, move all scores for that class into the key-array
4. Convert the array of scores into its average
5. Return the obj
*/

function courseAverages(students) {
  let uniqClasses = {};
  students.forEach(student => {
    student.courses.forEach(courseName => {
      if (!uniqClasses[courseName]) uniqClasses[courseName] = [];
    });

    for (let grade in student.scores) {
      uniqClasses[grade].push(student.scores[grade]);
    }
  });

  for (let course in uniqClasses) {
    let total = 0;
    uniqClasses[course].forEach(grade => total += grade);
    total = (total / uniqClasses[course].length);
    uniqClasses[course] = total;
    // console.log(uniqClasses, total);
  }
  
  return uniqClasses;
}
// Test cases
const students = [
  {
    name: 'Emma',
    scores: { math: 95, english: 80, history: 92 },
    courses: ['math', 'english', 'history']
  },
  {
    name: 'James',
    scores: { math: 70, english: 85, history: 75 },
    courses: ['math', 'english', 'history']
  },
  {
    name: 'Michael',
    scores: { math: 80, science: 90 },
    courses: ['math', 'science']
  }
];

console.log(courseAverages(students));
// { math: 81.66666666666667, english: 82.5, history: 83.5, science: 90 }

console.log(courseAverages([])); 
// {}

const singleStudent = [{
  name: 'Alice',
  scores: { art: 100 },
  courses: ['art']
}];

console.log(courseAverages(singleStudent)); 
// { art: 100 }