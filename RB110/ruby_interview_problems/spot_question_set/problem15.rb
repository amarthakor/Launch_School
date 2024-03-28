=begin
You live in the city of Cartesia where all roads are laid out in a perfect grid. 
You arrived ten minutes too early to an
appointment, so you decided to take the opportunity to go for a short walk. 
The city provides its citizens with a Walk
Generating App on their phones -- everytime you press the button it sends you 
an array of one-letter strings
representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk 
only a single block in a direction and you know it
takes you one minute to traverse one city block, so create a function that 
will return true if the walk the app gives you
will take you exactly ten minutes (you don't want to be early or late!) and 
will, of course, return you to your starting point.
Return false otherwise.



Note: you will always receive a valid array containing a random assortment of 
direction letters ('n', 's', 'e', or 'w' only). It will never give you an 
empty array (that's not a walk, that's standing still!).


Problem: Given an array of strings, return true or false

Rules:
1) return true IF
  - my walk takes exactly 10 minutes long
  - return to original starting point

2) otherwise return false
3) walking one block takes 1 minute exactly
4) each string array represents walking in that direction one block
  - every direction takes exactly 1 minute to walk
5) array will never be empty

Return true if
  - my given array size is equal to 10 as this ensures my walk is 10 minsutes long
  - all letters cancel out such that i return to the start point

- North and South are opposites therefore they cancel out at a 1:1 ratio
- EAST and WEST are opposites therefore they cancel out at a 1:1 ratio

Algorithm:
- RETURN false if array size is not equal to 10

- INITIALIZE start_point var set it to 0
- ITERATE over given array of chars
  - for each char
    - if the current char 'n' or 'e'
      - increment startpoint by + 1 or + 2
    - if the current char is 's' or 'w'
      - decrement the starptint by - 1 or - 2

- return true if startpoint is 0
=end

def is_valid_walk(array)
  return false if array.size != 10
  start_point = 0

  array.each do |direction|
    start_point += 1 if direction == 'n'
    start_point += 2 if direction == 'e'
    start_point -= 1 if direction == 's'
    start_point -= 2 if direction == 'w'
  end

  start_point == 0
end


p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
p is_valid_walk(["n", "w", "n", "w", "n", "w", "n", "w", "n", "w"]) == false