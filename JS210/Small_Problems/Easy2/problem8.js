function getGrade(grade1, grade2, grade3) {
  let avgGrade = (grade1 + grade2 + grade3) / 3;
  
  if (avgGrade >= 90) {
    return 'A';
  } else if (avgGrade >= 80) {
    return 'B';
  } else if (avgGrade >= 70) {
    return 'C';
  } else if (avgGrade >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

getGrade(95, 90, 93);    // "A"
getGrade(50, 50, 95);    // "D"