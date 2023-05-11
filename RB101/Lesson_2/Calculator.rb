## Command line calculator program
## ask user to input 2 numbers
# ask for operaiton type that will be preformed on those 2 numbers
# output the value of said numbers/operation
def prompt(message)
  Kernel.puts("> #{message}")
end

prompt("Welcome to Calculator")
prompt("Please enter two integer values")

loop do 
  num1 = Kernel.gets().chomp()
  if valid_integer =
num2 = Kernel.gets().chomp()

prompt("You entered #{num1} and #{num2}")
prompt("Which operation would you like to perform? Addition,
subtraction, multiplication, or division?")
operation = Kernel.gets().chomp().downcase

if operation == 'addition'
  result = num1.to_i + num2.to_i
elsif operation == 'multiplication'
  result = num1.to_i * num2.to_i
elsif operation == 'subtraction'
  result = num1.to_i - num2.to_i
else operation == 'division'
  result = num1.to_f / num2.to_f
end

prompt("The result is #{result}")
