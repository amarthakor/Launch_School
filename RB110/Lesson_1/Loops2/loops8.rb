# Modify the code using 'next' so that it only prints positive
# integers that are even

# number = 0

# until number == 10
#   number += 1
#   puts number
# end

number = 0

until number == 10
  number += 1
  if number.odd?
    next
  else
    puts number
  end
end
