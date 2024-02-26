=begin
What will the following code print, and why? Don't run the code 
until you have tried to answer.

--------------------------------------------------------------------
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
--------------------------------------------------------------------

On line 1 we initalize local variable array1 to reference an array
of string objects ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"].
On line 2 we initalize local variable array2 to reference an empty array
On line 3 we invoke the each method on the array referenced by `array1`, where
for each iteration of the block, we invoke the mutating #<< method on the
array referenced by `array2` and pass the current element as an argument.
This appends each string element from array1 into array2, so now they both
reference the same objects within the arrays
On line 3 we invoke the each method on the array referenced by `array1` and pass
a block as an argument, where for each iteration, we invoke the mutating
`upcase!` method on the current element IF the element starts with a
C or S.
On line 5, we invoke the puts method and pass it the array referenced by 
array2.
This outputs an array of string objects, where every element that starts
with C or S is all uppercased, the rest of the elements are just
capitalized.

array2 => ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
This happens because initially array2 is an empty array and then we push in each
element within array1 into array2. Since the #<< is mutating, the individual 
objects w/n both arrays are the same, i.e. the objects referenced within array2
refernce the same objects within array1. Next, during iteration on line 4, we invoke
the upcase! mutating method on the objects referenced within array1, which again, 
are also referenced by array2. Since we are mutating the objects within array1,
rather than the array itself, this mutation is reflected in array2 as well.