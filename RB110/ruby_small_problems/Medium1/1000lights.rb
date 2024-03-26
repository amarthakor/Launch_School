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

Problem: Given an integer, return an array of integers

Rules:
- The argument represents the total number of switches for light bulbs
- The return array represents which lightbulbs are turned "on"
- On the first pass, you toggle all lights. Since they are initially all off,
  you turn them all on
- On the next pass, you toggle switches 2, 4, 6... since they are "on", you
  have just turned them off
- On the next pass you toggle swtiches 3, 6, 9.. etc..
- you repeat this process until you have done 'n' passes/repetitions

- Whatever the integer argument is will represent how many repetitions/iterations
  there are
- Since some numbers will be divisble by multiple factors, they may get turned
  on or off multiple times
    - i.e. First pass : [1, 2, 3, 4, 5, 6] are on
           Second pass: [1, 3, 5]          are on (turned off 2, 4, 6)
           Third pass : [1, 5, 6]          are on (turned off 3, turned on 6)
           Fourth pass: [1, 4, 5, 6]       are on (turned on 4)
           Fifth pass : [1, 4, 6]          are on (turned off 5)
           Sixth pass : [1, 4]             are on (turned off 6)

- Will have to figure out how to add/ remove a number multiple times
- Going to increase in switches toggled by +1 each pass until
  the pass represented by given integer is reached
- Need a way to create all switches
- Need to represent the current multiple and increment it by 1 each pass
- If a number is already "on" or "in" the array, I need to remove it
- If a number is "off" or "out" of the array, I need to include it
- So for each "number" or iteration
  - I need to figure out which multiples of a factor are being toggled
  - Need to figure out how to check if the multiple is "in" or "out"
  - Then I need to add / remove it

- 1 will ALWAYS remain "in" or turned "on"
Algorithm:
- CREATE an array of digits from 1 to 'n'#
- ITERATE 'n' times
  - for each number
    - CHECK if each multiples of the current num upto 'n' are in the array
      - if they are not, add them in
      - if they are, remove them
  - repeat for every digit in the array


=end

def lights(switches)
  all_lights = (1..switches).to_a
  copy_arr = all_lights.dup

    2.upto(switches) do |factor|
      copy_arr.each do |num|
        if num % factor == 0 && all_lights.include?(num)
          all_lights.delete(num)
        elsif num % factor == 0
          all_lights << num
        end
      end
    end

    all_lights
end


p lights(1) == [1]
p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
