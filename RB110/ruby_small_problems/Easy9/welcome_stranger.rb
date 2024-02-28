=begin
Create a method that takes 2 arguments, an array and a hash. The array will 
contain 2 or more elements that, when combined with adjoining spaces, will 
produce a person's name. The hash will contain two keys, :title and :occupation, 
and the appropriate values. Your method should return a greeting that uses the 
person's full name, and mentions the person's title and occupation.

Example:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

--- P
- GIVEN: an array, with 2 or more elements, and a hash with 2 k-v pairs
- RETURN: return a greeting that uses the persons full name (array elements)
          - and mentions the person's title and occupation (k-v pairs)
- output to console
- string format
- 
--- E
['john', 'q', 'doe'] => '... John Q Doe!...'
{ title: 'master', occupation: 'plumber'} -> '.... Master Plumber ....'
--- D
beginning: array and hash
intermediate: use both to interpolate values into string at specific locations
end: string

--- A
- FORMAT output string
- CONVERT array into string separating elements by whitespace
- INTERPOLATE output string w/ this array string
- INTERPOLATE output string w/ hash values
- RETURN output string
=end

def greetings(array, hash)
  name = array.join(' ')
  job_rank = hash[:title] + ' ' + hash[:occupation]
  "Hello, #{name}! Nice to have a #{job_rank} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })