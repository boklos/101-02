# car loan calculator
def prompt(message)
  puts("=>#{message}")
end

def number_valid(num)
  num =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end

def integer?(input)
  /^\d+$/.match(input)
end

num_payments = 0
prompt" Welcome to car calculator"
price = ''
loop do
  prompt"Please enter car price"
  price = Kernel.gets().chomp()

  if number_valid(price)
    break
  else
    prompt"please enter a valid value"
  end
end
down = ''
loop do
  prompt"Please enter down payment value"
  down = Kernel.gets().chomp()
  if number_valid(down)
    break
  else
    prompt"please enter a valid value"
  end
end
loan = price.to_f - down.to_f
loan = loan.round(2)
prompt"your loan amount is #{loan}"
rate = ''
loop do
  prompt"enter interest rate from 0.0 to 29.99"
  rate = Kernel.gets().chomp()
  if number_valid(rate) && 0.0 <= rate.to_f && rate.to_f <= 29.99
    break
  else
    prompt"please enter a valid value"
  end
end

# calculate monthly interest rate
rate_monthly = rate.to_f / 100 / 12

term = ''
loop do
  prompt"enter number of months"
  term = Kernel.gets().chomp()
  if integer?(term)
    break
  else
    prompt"please enter a valid value"
  end
end
term = term.to_i

if rate_monthly != 0
  # monthly payment formula
  monthly_payment = loan * (rate_monthly * (1 + rate_monthly)**term) / ((1 + rate_monthly)**term - 1)

  monthly_payment = monthly_payment.round(2)

  prompt"your monthly payment is #{monthly_payment}"

  # Calculate amortized payment schedule
  while num_payments < term
    num_payments += 1
    n = (1 + rate_monthly)**num_payments - 1
    balance = loan * (1 + rate_monthly)**num_payments - (monthly_payment * (n / rate_monthly))
    balance = balance.round(2)
    balance = balance < 1 ? 0 : balance
    prompt" your remaining balance is #{balance} after #{num_payments} payments made"
  end

elsif rate_monthly == 0
  monthly_payment = loan / term
  prompt"your monthly payment is #{monthly_payment}"
  while num_payments < term
    num_payments += 1
    balance = loan - (monthly_payment * num_payments)
    balance = balance.round(2)
    prompt" your remaining balance is #{balance} after #{num_payments} payments made"
  end
end
prompt"thanks for using our calculator"
