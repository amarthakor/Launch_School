=begin

Write a method that takes a string, and then returns a hash that 
contains 3 entries: one represents the number of characters in the
string that are lowercase letters, one represents the number of
characters that are uppercase letters, and one represents the number
of characters that are neither.

Examples:
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

--------------------

--- P
- given: string with alpha chars; lower and/or uppercase, whitespace, numbers
- Return: Hash with 3 key-value pairs; 
          1) the first kv pair represents the lowercase chars and # of lowercase chars
          2) the 2nd kv pair represents the uppercase chars and # of uppercase chars
          3) the 3rd kv pair represents nonalpha chars and their count

  - arguments will always be string
  - argument can be empty string
      - in which case we return 0 for all values
  - may contain only numbers
    - classified in the 3rd KV pair 'neither'
  - may contain whitespace
    - classified in the 3rd KV pair 'neither'
  - may contain special chars
    - classified in the 3rd KV pair 'neither'
--- E

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
  - 'abdef' = 5 chars, lowercase: 5 
  - 'C' = 1 char, uppercase: 1
  - ' 123' = 4chars, niether: 4
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
  - 'ACE' = 3chars, uppercase: 3
  - 'bdf' = 3chars, lowercasE: 3
  - ' +' = 2chars, neither: 2, can insinuate special chars count as 'neither'
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
  - '123' = 3chars, neither: 3
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
  - '' = 0chars, all values are == 0

--- D
beginning: string
intermediate: array would allow easy iteration of each string char to then update hash value
ending: hash

--- A
- CREATE a hash with 3 KV pairs to represent the wanted output
- CONVERT string to array of chars
- for each char in given string
  - if char is included in lowercase 'a-z',
      increment lowercase value by 1
  - else if the char is included in 'A-Z'
      increment uppercase value by 1
  - else if neither are true
      increment neither value by 1
RETURN hash
=end

def letter_case_count(string)
  results_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  string = string.chars
  
  string.each do |char|
    if ('a'..'z').include?(char)
      results_hash[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      results_hash[:uppercase] += 1
    else
      results_hash[:neither] += 1
    end
  end
  results_hash
end




puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }