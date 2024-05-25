# Write a program that can generate the lyrics of the 99 Bottles of Beer song

=begin
---- P
Problem: Given a number, return a string from 99 Bottles of Beer song

Rules:
- 2 class methods
  - #verse
    - returns the specified verses of the song
    - should be able to take multiple verse
      - *splat operator?
  - #lyrics
    - returns the entire song

- All verses from 3-99 are the same except # of bottles changes
  - probably use string interpolation
- Verse 2 is distinct
- Verse 1 is distinct
- Verse 0 is distinct

---- E
Check test suite

--- D
n/a

---- A
- CREATE class method #verse() that takes *multiple arguments
  - INIT verses to empty string
  - ITERATE over arguments provided
    - for each argument
      - if the argument is between 3..99
        - append the correct lyrical string to verses
      - if the arugment is 2
        - append the correct lyrical string to verses
      - if the arugment is 2
        - append the correct lyrical string to verses
      - if the arugment is 2
        - append the correct lyrical string to verses
  - RETURN verses

- CREATE class method #lyrics
  - SET variable `lines` to 97
  - INITialize verses to emppty string
  - ITERATE 97 times
    - for each iteration
      - OUTPUT song lyrics with value of lines interpoalted into string to represent bottles
      - append the string to verses
      - Decrement `lines` by 1
  - RETURN verses
=end

class BeerSong
  def self.verses(*lines)
  end

  def self.verse(line)

  end
  
  def self.lyrics
    line = 99
    verses = ''

    100.times do |_|
      if line > 2
        verses << "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" +
        "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
        verses << "\n"
      elsif line == 2
        verses << "#{line} bottles of beer on the wall, #{line} bottles of beer.\n" +
        "Take one down and pass it around, #{line - 1} bottle of beer on the wall.\n"
        verses << "\n"
      elsif line == 1
        verses << "#{line} bottle of beer on the wall, #{line} bottle of beer.\n" +
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
        verses << "\n"
      else line == 0
        verses << "No more bottles of beer on the wall, no more bottles of beer.\n" +
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
      line -= 1
    end

    verses
  end
end

test = BeerSong.verses(99, 98)
test
