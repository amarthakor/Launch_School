=begin
Write a method that determines the mean (average) of the three scores passed to it,
 and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'
Tested values are all between 0 and 100. There is no need to check for negative
values or values greater than 100.

Example:
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

--- P
- GIVEN: 3 integer values representing grades
- RETURN: single char representing average of 3 integer grades

- all grade values will be between 0-100 only
- 5 possible grade outcomes
--- E
- (95, 90, 93) = 95 + 90 + 93 = 278 / 3 = 92.667 = 'A' grade

--- D
beginning: 3 integer arguments
intermediate: no need to use DS for basic mathematical operations
end: stirng

--- A
- CALCULATE the grade
  - g1 + g2 + g3 / 3
- RETURN the grade letter dependent on the grade
  - employ a conditional statement


=end

def get_grade(grade1, grade2, grade3)
  grade = (grade1 + grade2 + grade3) / 3
  if grade >= 90
    'A'
  elsif grade >= 80
    'B'
  elsif grade >= 70
    'C'
  elsif grade >= 60
    'D'
  else
    'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(0, 10, 10) == 'F'
puts get_grade(80, 82, 82) == 'B'
puts get_grade(70, 75, 75) == 'C'