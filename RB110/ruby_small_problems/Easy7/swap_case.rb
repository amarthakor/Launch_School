=begin
Write a method that takes a string as an argument and returns a new string
in which every uppercase letter is replaced by its lowercase version, and
every lowercase letter by its uppercase version. All other characters should
be unchanged.

You may not use String#swapcase; write your own version of this method.

EXAMPLE:
swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

------------------------------
--- P
- GIVEN: string argument
- RETURN: NEW string
          - where every uppcased letter is downcased
          - every downcased letter is upcased
          - every other char is left unchanged
          - cannot use swapcase
  - what happens if string is empty?
  - what happens if non string arg is given?
  - 
--- E
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
  - Uppcased chars = 'TXYZTV' turns into 'txyztv'
  - lowcased chars = 'onighton' turns into 'ONIGHTON'
  - unchanged chars = '  -' 
    - whitespace and any nonalphabetical chars such as special/numeric left unchanged


--- D
-beginning: string
intermediate: array would allow transofrmation over each char
ending: string
--- A
- CONVERT string into array of 'words'
  - split into individual chars
- TRANSFORM chars based on previously defined rules
  - for each char, #map
  - if the current char is equal to the char lowercased
    - uppercase the char #upcase
  - else
    - lowercase the char #downcase

- CONVERT array back into string
  - join(' ')
- RETURN string

=end

def swapcase(string)
  string.chars.map do |char|
    (char == char.downcase) ? char.upcase : char.downcase
  end.join
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'