=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of 
switches and toggle every one of them. You go back to the beginning, and on 
this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, 
you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and 
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

--- P
- GIVEN: integer that represents the total number of light switches
- RETURN: array that represents which lights are on after 'n' repetitions.
  - all light switches from 1..n are initially turned off
  - first round flip them all on: 1, 2, 3, 4, 5
  - second round flip multiples of 2 on/off: 1, 3, 5
  - third round flip multiples of 3 on/off: 1, 5
  - fourth rounf flip multiples of 4 on/off: 1, 4, 5
  - fifth round flip multiples of 5 on/off: 1, 4
  therefore return [1, 4]

--- E
- as above

--- D
beginning: integer
middle: array to initiate some form of iteration 
end: array

--- A
- RETURN [1] if given integer is equal to 1
- CREATE a comparison array from 1..n
- CREATE duplicate of original array
- ITERATE n times on the array, from 2 #upto n
  - EMPLOY conditional to check if current value is present in array
    - if it is, remove multiples of current value from array
    - if it is not, add multiples of said value to array
- RETURN array

=end

def lights(switches)
  return [1] if switches == 1
  comparison_array = (1..switches).to_a
  results_array = comparison_array.dup
  2.upto(switches + 1) do |round| # only considers current num, not all multiples of num.. need to fix
    p round
    if results_array.include?(round)
      results_array.delete_if { |lights| lights % round == 0 }
      p results_array
    else 
      comparison_array.each { |num| results_array << num if p (num % round == 0) }
      p results_array
    end
  end
  results_array
end

# p lights(1) == [1]
# p lights(5) #== [1, 4]
lights(10) #== [1, 4, 9]

# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

# - 2) 1, 3, 5, 7, 9, 
# - 3) 1, 5, 7, 
# - 4) 1, 4, 7, 8, 
# - 5) 1, 4, 5, 7, 8, 10