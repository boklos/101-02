# ask user for two numbers
# ask user for an operation to perform
# perform the operation
# display the resuly

Kernel.puts(" Welcome to calculator")

Kernel.puts(" pick the first number ")
num1 = Kernel.gets().chomp()

Kernel.puts("pick the second number")

num2 = Kernel.gets().chomp()

Kernel.puts (" choose your operator 1) addition 2)substraction 3) multiply 4) divide")

operator = Kernel.gets().chomp()

if operator == "1"
  result = num1.to_i + num2.to_i
elsif
  operator == "2"
  result = num1.to_i- num2.to_i
elsif
    operator == "3"
    result = num1.to_i * num2.to_i
else
   result = num1.to_f / num2.to_f
end





Kernel.puts(" the result is #{result}")
