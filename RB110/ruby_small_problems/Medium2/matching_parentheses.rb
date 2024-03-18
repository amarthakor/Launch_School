=begin
Write a method that takes a string as an argument, and returns true if all
parentheses in the string are properly balanced, false otherwise. To be 
properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
balanced?('What ())(is() up') == false

**Note that balanced pairs must each start with a (, not a ).

--- P
- GIVEN: string
- RETURN: boolean T/F where
          - true if all parantheses in the string are properly balanced
          - false otherwise
          - properly balanced means ( must have a matching )
            - must start with a (, not a )

- what happens if string is empty?
- what happens if no parantheses are found in string?
  - return true

--- E
- balanced?('What (is) this?') == true
  - 2 (, 2 ) == true

- balanced?('What is) this?') == false
  - 0 (, 1 ) false

- balanced?('What (is this?') == false
  - 1 (, 0 ), false

- balanced?('((What) (is this))?') == true
  - 3 (, 3 ), true

- balanced?('((What)) (is this))?') == false
  - 3 (, 4 ), false

- balanced?('Hey!') == true
  - none == true

- balanced?(')Hey!(') == false
  - 1 (, 1 ), not in order, return false

- balanced?('What ((is))) up(') == false
  - 2 (, 3 ), false
- balanced?('What ())(is() up') == false
  - equal but out of order, false

--- D
begin: string
middle: array to iterate over chars and modify/analyze each one
end: boolean T/F

--- A
- MOVE all ( ) into a new array
- CREATE two variables to represent ( and ), set them to 0
- ITERATE over all () chars
  - if the current char is an (
    - increment the (var by += 1
  - if the char is ), increment the )var by +=1
  - return false if the )var is more than the (var
- if ( var and )var are equal return true

=end

def balanced?(string)
  open_par, close_par = 0, 0
  parantheses = []
  
  create_only_par(string, parantheses)

  parantheses.each do |char|
    char == '(' ? open_par += 1 :close_par += 1
    return false if close_par > open_par
  end

  open_par == close_par
end

def create_only_par(str, array)
  str.chars.each { |char| array << char if char == '(' || char == ')' }
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false