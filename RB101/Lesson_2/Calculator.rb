## Command line calculator program
Kernel.puts("Please enter two integer values")
num1 = Kernel.gets().chomp().to_f
num2 = Kernel.gets().chomp().to_f

Kernel.puts("You entered #{num1} and #{num2}")
Kernel.puts("Which operation would you like to perform? Addition,
subtraction, multiplication, or division?")
operation = Kernel.gets().chomp().downcase

if operation == 'addition'
  Kernel.puts("#{num1} + #{num2} = #{num1 + num2}")
end
