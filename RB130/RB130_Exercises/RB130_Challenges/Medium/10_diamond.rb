# The diamond exercise takes as its input a letter, and outputs it in
# a diamond shape. Given a letter, it prints a diamond starting with
# 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# Diamond for letter 'A':

# A


# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A
=begin
--- P
Problem: Given a letter from the alphabet, output a diamond formed by letters

Rules:
- Must have constructor method
  - Dont need any state ?
- Must have class method #make_diamond()
  - takes one argument, capital alphabetical char A-Z
- Top half is reflected by the bottom half
- Each row only has two letters separated by spaces, except the row of A
- The position of the argument alphabet letter passed to #make_diamond
  indicates how many spaces the A level row will be indented by.
  - Each subsequent letter will decrement the spacing by 1 until target letter
    is reached
  - Once midpoint is reached, each letter will be indented by incremented
    spaces of 1 for each subsequent row past the midpoint
- Spaces in middle of letters start off at 0 space for A (since only 1 letter)
- Spaces in middle of letters start off at 1 space for B
  - and increment by +2 spaces for each consecutive letter
- Probably need to handle letter A separately from
  - other letters of alphabet which will have multiple letters in the same row

--- D
proably use Array to iterate over letters and track spaces?

--- A
- CREATE Constructor method
- CREATE #make_diamond method
  - if argument is A
    -return A
  - CREATE helper method for 'A' of top and bottom of diamond
    - output space * the index position of the target_letter + 'A'
    - decrement spacer by 1
  - CREATE helper method for top half of diamond
    - ITERATE from 'B'..letter
    - create mid_spacer and set to 1
      - for each letter
        - output space * the current spacer + letter + mid_spacer + letter
        - decrement spacer by 1
        - increment mid_spacer by 2
  - CREATE middle row helper method
    - 
  - CREATE helper method for bottom half of diamond
  - INSERT helper method for 'A' bottom of diamond
    - output space * the index position of the target_letter + 'A'
=end

# Diamond outputter class
class Diamond

  def self.make_diamond(letter)
    if letter == 'A'
      puts "A"
    else
      top_and_bottom_a(letter)
      mid_spacer = make_top_half(letter)
      make_bottom_half(letter, mid_spacer)
      top_and_bottom_a(letter)
    end
  end

  private
  
  ALPHABET = ('A'..'Z').to_a

  def self.top_and_bottom_a(letter)
    init_spacer = ALPHABET.index(letter)
    puts "#{' ' * init_spacer}" + "A"
  end

  def self.make_top_half(letter)
    init_spacer = ALPHABET.index(letter) - 1
    mid_space = 1
    ('B'..letter).each do |char|
      puts "#{' ' * init_spacer}#{char}" + "#{' ' * mid_space}#{char}\n"
      init_spacer -= 1
      mid_space += 2
    end
    mid_space - 4
  end

  def self.make_bottom_half(letter, mid_space)
    init_spacer = 1
    ('B'...letter).to_a.reverse.each do |char|
      puts "#{' ' * init_spacer}#{char}" + "#{' ' * mid_space}#{char}"
      init_spacer += 1
      mid_space -= 2
    end
  end

end

Diamond.make_diamond('A')
Diamond.make_diamond('B')
Diamond.make_diamond('C')
Diamond.make_diamond('E')