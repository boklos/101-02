def prompt(message)
  puts("=>#{message}")
end

def number_valid(num)
  num.to_i != 0
end

def operation_message(op)
  case op
  when '1'
    'Adding now...'
  when '2'
    'Substracting now...'
  when '3'
    'Multiplying now...'
  when '4'
    'Dividing now...'
  end
end

prompt(" Welcome to calculator Please enter your name")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(" please enter your name")
  else
    break
  end
end

prompt("Hello #{name}")
loop do # main loop
  num1 = ''
  loop do
    prompt(" pick the first number ")
    num1 = Kernel.gets().chomp()

    if number_valid(num1)
      break
    else
      prompt("please enter a valid number")
    end
  end

  num2 = ''
  loop do
    prompt("pick the second number")
    num2 = Kernel.gets().chomp()
    if number_valid(num2)
      break
    else
      prompt("please enter a valid number")
    end
  end

  prompt_list = <<-LIST
  What operation do you want to perform?
  1) Addition
  2) Substract
  3) Multiply
  4) Divide

  LIST
  prompt(prompt_list)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4 ).include?(operator)
      break
    else
      prompt("please choose one of the 4 operations only")
    end
  end
  prompt("#{operation_message(operator)} #{name}")

  case operator
  when '1'
    result = num1.to_i + num2.to_i
  when '2'
    result = num1.to_i - num2.to_i
  when '3'
    result = num1.to_i * num2.to_i
  when '4'
    result = num1.to_f / num2.to_f
  end

  prompt(" the result is #{result}")
  prompt("do you have another calculation? type Y for yes")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end
