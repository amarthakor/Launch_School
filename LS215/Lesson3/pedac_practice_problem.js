// In the game of chess, a queen can attack pieces which are
// on the same row, column, or diagonal.
// Positions on the board equate to coordinat enumbers.
// Given a set up like so:

// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ W _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ B _
// _ _ _ _ _ _ _ _
// _ _ _ _ _ _ _ _

// The white queen's position equates to (2, 3) and the black
// queen is at(5, 6). In this example the queens are one thesame diagonal,
// and therefore can attack each other.In

// Write a function which, given a string representation of
// the board with the two queens, returns true or false depending
// on whether the queens can attack each other or not.

/*
---- P
- Input:
  - A string representation of a board with two queens
- Output:
  - true or false based on if the queens can attack each other
  - true if attackable, false if not attackable

- Rules:
  - The queen's coordinates are represented as (row, column)
    - The first row and column are 0 based index ( 0, 1, 2, 3 )...
  - The queens can attack each other in 3 situations, when they are:
    - in the same row, -> Same 'row' coordinate ex: (3, 5) and (3, 2)
    - in the same column, -> Same 'col' coordinate ex: (0, 3) and (5, 3)
    - in the same diagonal -> difference b/w row numbers == difference b/w col number
      - ex) (2, 3) and (5, 6) -> 5 - 2 = 3 and 6 - 3 = 3

  - Assumptions:
  - Board is 8x8, but 0 based indexed, thus 0-7
  - Are other pieces on the board?
    - In this case no.
  - Will queen's be represented by 'B' for blackqueen and 'W' for whitequeen
    - Assume yes.
  - Will there always be two queens on the board?
    - Queen's may be missing on the board
  - If only one queen on board, how do we return value?
    - return undefiend if one or both queens are missing
    - 0 queens, 1 queen, or 2 queens

    - We will always be given a board
    - Ask what will be given in input
    - For example, ask if the input will be one whole string or 
      - multiple strings
      - arrays
      - objects
      - etc.
    
  - 
---- E


---- D


---- A



*/