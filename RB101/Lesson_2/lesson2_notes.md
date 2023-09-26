# Pseudocode
- Pseudocode is a problem solving approach that allows a person to
understand the "logical problem domain layer" by creating a solution
in everyday human language, thus allowing a free flow of logic w/o the
shortcomings of syntatical language errors causing breakdowns.
- The 2 layers to solving any problem are:
  - Logical problem domain layer
  - Syntactical programming language layer

# Formal Pseudocode
- Formal pseudocode is a more refined form of pseudocode that utilizes 
syntactical key words to help create structure and help make the process of 
translating pseudocode to programmable code easier.
- keywords
  - START: start of the program
  - SET: set a variable for use later in the program
  - GET: retrieves input from user
  - PRINT: displays output to user
  - READ: retrieves value from user
  - IF / ELSIF/ ELSE: shows conditional branches in logic
  - WHILE: shows looping logic
  - END: end of program

- While formal pseudocode looks very similar to actual code syntax, we cannot
verify that the logic is sound and functions as intended, so our last step is
to translate our formal psuedocode to actual programming language snytax

- Since pseudocode/formal pseudocode is our guess at creating a solution that
is not verifiable, we can only confirm its correctness by translating to actual
code. For more complex problems, often times the first pseudocode will be
incorrect, therefore it is much easier to tackle difficult problems in a 
step by step manner. Create pseudocode for a specific part of the program, 
refine to formal pseudocode, and then translate to actual language snytax.
Once you have verified the small piece functions as intended, move onto the
next step in the program, until the entire program has been completed.

## Pseudocode practice problems
1. a method that returns the sum of 2 integers
  - define method with two parameters
  - w/n method def. add the two variables passed to the method
  - end of method def.

    - Formal pseudocode:
    - START: num1 + num 2
    - END

2. a method that takes an array of strings, and returns a string that is all
strings in the array concatenated together
  - arr.join
    - START: arr.join
    - END

3. a method that takes an array of integers, and returns a new array with every
other element from the original array, starting w/ the first element.
  - save the new array as an empty array
  - iterate over the original array, where:
  - if the index of the original array is even
  - push that value to the new array
  - return the new array

    - START:
    - SET new_arr equal to an empty array
    - Iterate over origin_arr, where
    - If index of origin_arr.even?
    - new_arr << origin_arr[index]
    - end iteration
    - RETURN new_arr
    - END