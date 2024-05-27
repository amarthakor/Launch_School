# The diamond exercise takes as its input a letter, and outputs it in
# a diamond shape. Given a letter, it prints a diamond starting with
# 'A', with the supplied letter at the widest point.
# 2:40pm
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

# --- P
# Problem: Given a letter from the alphabet, return multiple strings that form a diamond

# Rules:
# - The shape of the output is a square (width and height are equal)
# - The first and last row only have one character, A
#   - All other rows have the same char appear twice
# - The top half ascends in alphabetical order
# - The bottom half descends in reverse alphabetical order
# -The top half and bottom half are mirror images
# - Row 'B' has only 1 space in between B's
# - Row 'C' has 3 spaces in between letters
# - Row D+ increment the spacing by 2
# - Total output should resemble a square, NOT a diamond

# ---- E
# - Check test cases

# ---- D
# - Array to iterate from A-> letter target
# - Hash to store spaces count for middle of diamond?

# ---- A
# - Need one class method #make_diamond() takes one argument from Alphabet
#   - return value is a square output with letters in a diamond shape
#   - init empty string, output = ''
#   - If argument is 'A', return "A\n"
#   - need  method for top A and bottom A
#     - append to output "#{' ' * index of given _letter}A#{' ' *idx space}\n"
#   - need  method for top half of diamond from B..letter
#     -
#   - need method for bottom half of diamond from letter...B
#   - use method for bottom of A

# class Diamond
class Diamond
  ALPHA = ('A'..'Z').to_a
  MID_SPACE = { 'A' => 0, 'B' => 1, 'C' => 3, 'D' => 5, 'E' => 7, 'F' => 9, 'G' => 11,
                'H' => 13, 'I' => 15, 'J' => 17, 'K' => 19, 'L' => 21, 'M' => 23, 'N' => 25,
                'O' => 27, 'P' => 29, 'Q' => 31, 'R' => 33, 'S' => 35, 'T' => 37, 'U' => 39,
                'V' => 41, 'W' => 43, 'X' => 45, 'Y' => 47, 'Z' => 49 }.freeze

  def self.make_diamond(letter)
    display = ''
    if letter == 'A'
      display << "A\n"
    else
      output_first_last_row(letter, display)
      output_half_of_diamond(letter, display, ALPHA.index(letter) - 1, false)
      output_middle_of_diamond(letter, display)
      output_half_of_diamond(letter, display, 1) { |ltrs| ltrs.reverse }
      output_first_last_row(letter, display)
    end
  end

  def self.output_first_last_row(letter, output)
    output << "#{' ' * ALPHA.index(letter)}A#{' ' * ALPHA.index(letter)}\n"
  end

  def self.output_half_of_diamond(letter, output, spc, increment = true)
    letters = ('B'...letter).to_a
    letters = yield(letters) if block_given?
    letters.each do |ltr|
      output << "#{' ' * spc}#{ltr}#{' ' * MID_SPACE[ltr]}#{ltr}#{' ' * spc}\n"
      increment == true ? (spc += 1) : (spc -= 1)
    end
  end

  def self.output_middle_of_diamond(letter, output)
    output << "#{letter}#{' ' * MID_SPACE[letter]}#{letter}\n"
  end
end

test = Diamond.make_diamond('E')
puts test
