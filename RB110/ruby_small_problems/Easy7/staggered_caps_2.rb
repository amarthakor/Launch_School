=begin
Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each 
letter. The non-alphabetic characters should still be included in the return
value; they just don't count when toggling the desired case.

EXAMPLES:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

------------------------------------
--- P
- GIVEN: string argument
- RETURN: STRING argument where
          - starting with the first char, every other char is uppercased
          - starting w/ index 1, every other char is downcased
          - nonalphabetical chars should be skipped as to not
          affect transformation of letters, but still appear in return string
- what happens if str is empty
-what happens if non str arg is provided?

--- E
staggered_case('ALL CAPS') == 'AlL cApS'
  - upcased chars: first char and EO = 'AlL cApS'
    - the whitespace doesnt count as a char, therefore we start counting again
      on 'caps'
  - dowcased chars:'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


--- D
begining: string
intermediate: array to iterate over select values and transform chars to wanted output
ending: string

--- A
- CONVERT string into all lowercase
- CONVERT string into array of chars
- CREATE a counter to track even chars and odd chars
  - set counter to 0
- TRANSFORM array of chars per rules explained above
  - if current char is included in alphabet
    - for every even index upcase the char
  - if current char is not included in alphabet
    - dont change the char
- CONVERT array of chars into string
- RETURN chars


=end

def staggered_case(string)
  counter = 0
  string.downcase.chars.map do |char|
    if ('a'..'z').include?(char) && counter.even?
      counter += 1
      char.upcase
    elsif ('a'..'z').include?(char) && counter.odd?
      counter += 1
      char.downcase
    else
      char
    end
  end.join
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'