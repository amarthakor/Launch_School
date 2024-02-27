=begin
Write a method that takes a String as an argument, and returns a new String
that contains the original value using a staggered capitalization scheme
in which every other character is capitalized, and the remaining characters
are lowercase. Characters that are not letters should not be changed, but 
count as characters when switching between upper and lowercase.


EXAMPLES:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

----------------------------------------------------------------
--- P
- GIVEN: string argument
- RETURN: STRING where;
          - uppercase every other character
          - nonuppercased letters should be downcased
          - whitespace and numbers count as chars, so do not skip over them when
            counting characters
          - numbers/whitespace/non-letters remain unchanged
          - what happens if str arg is empty?
          - what happens if non str arg is provided?
--- E
staggered_case('ALL_CAPS') == 'AlL_CaPs'
  - 8 characters total
  - capitalize EOC -> 'A L C P' starts at 0 index
  - downcase EOC starting at 1 index -> 'AlL_CaPs' 
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
  - 25 chars total
  - capitalize EOC starting at 0index i.e., 0, 2, 4, 6.. => "INR 7 TE 44 NMES'
  - downcase EOC starting at 1index i.e., 1, 3, 5,... => "goe 7 4 ubr"

--- D
beginning: string
intermediate: array to perform transofrmation on individ chars and allow iteration
end: string
--- A
- CREATE an array of chars
  - chars method
- TRANSFORM array of chars
  - for each char #map.withindex
    - if the index is even, upcase the char
      -#even? #upcase
    - if the index is odd, downcase the char
      - odd? downcase
- CONVERT array into string
  - join
- RETURN str

=end

def staggered_case(str)
  str.chars.map.with_index do |char, idx|
    idx.even? ? char.upcase : char.downcase
  end.join
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'