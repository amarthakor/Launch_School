def find_missing_letter(array)
  first = array[0]
  last = array.last

  whole_array = (first..last).to_a

  missing_ltr = (whole_array - array).join

  reverse_case(missing_ltr)
end

def reverse_case(letter)
  if letter == letter.upcase
    letter.downcase
  else
    letter.upcase
  end
end

def missing_letter(array)
  if array.empty?
    return []
  else
    find_missing_letter(array)
  end
end

p missing_letter(['a', 'b', 'c', 'd', 'f']) == 'E'
p missing_letter(['o', 'q', 'r','s']) == 'P'
p missing_letter(['H', 'J', 'K', 'L']) == 'i'
p missing_letter([]) == []
