=begin
- given: string
- return: an array of two elements,
          - a minimum substring, 't', 
          - a maximum number 'k',
          - such that 't' x 'k' will be equal to the given string
          
EXAMPLE:
- given: 'ababab'
- return: ['ab', 3]
  - the minimum substring 'ab' can be repeated |3| times to 
    be equal to the given srting 'ababab'
  - the smallest substring 'a' or 'b' cannot be repeated any 
    amount of times and stil equal 'ababab'
-----------------------------------------------------------------------

- given: 'abcde'
- return: ['abcde', 1]
        - the smallest substring within the given substring 'abcde'
          that can be repeated and still equal the given substring 'abcde'
          is the entire string itself
        - no smaller substring can be repeated to equal the given string
        - therefore
          t = 'abcde', k = 1
          t * k = 'abcde'

- CREATE an array from 1 to the size of the given array
- CREATE an array of all possible substrings
- FOR EACH substring, 
  - multiple the substring by every element in the size array
  - if the substring multipled by a number is equal to the given string
    - append the substring to results array
    - append the current num to results array
- SELECT the smallest str and largest integer value in the results array
- RETURN the results array
=end

def substrings(str)
  substr = []
  str.size.times do |start_idx|
    start_idx.upto(str.size - 1) do |end_idx|
      substr << str[start_idx..end_idx]
    end
  end
  substr = substr.uniq
end

def find_factors(word, possible_results, numbers)
  results_array = []
  possible_results.size.times do |str|
    numbers.each do |num|
      if possible_results[str] * num == word
        results_array << possible_results[str]
        results_array << num
      end
    end
  end
  results_array
end

def min_substring(string)
  repeated_values = (1..string.size).to_a
  possible_substr = substrings(string)
  possible_results = find_factors(string, possible_substr, repeated_values)

  strings, sizes = possible_results.partition { |ele| ele.class == String }

 [strings.min, sizes.max]
end

p min_substring('ababab') == ['ab', 3]
p min_substring('abcde') == ['abcde', 1]