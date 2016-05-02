# car loan calculator

# methods
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

# welcome message
prompt (" Welcome to car calculator")

# get price from user
price = ''
  loop do
    prompt ("Please enter car price")
    price = Kernel.gets().chomp()

    if number_valid(price)
      break
    else
      prompt("please enter a valid value")
    end
end

#get down payment from user
down = ''
loop do 
    prompt ("Please enter down payment value")
    down = Kernel.gets().chomp()
    if number_valid(down)
      break
    else
      prompt("please enter a valid value")
    end
end

#calculate loan amount  
loan = price.to_f - down.to_f
prompt ("your loan amount is #{loan}")

# get interest rate from user
rate = ''
loop do 
    prompt ("enter interest rate from 0.0 to 29.99")
    rate = Kernel.gets().chomp()
    if number_valid(rate)
      break
    else
      prompt("please enter a valid value")
    end
end

# calculate monthly interest rate
rate_monthly = (rate.to_f/100)/12

# get term duration in months
term = ''
loop do 
    prompt ("enter number of months")
    term = Kernel.gets().chomp()
    if integer?(term)
      break
    else
      prompt("please enter a valid value")
    end
end
term = term.to_i

# monthly payment formula
monthly_payment = loan*(rate_monthly*(1 + rate_monthly)**term)/((1+ rate_monthly)**term - 1)
# round decimal of monthly payment
monthly_payment = (monthly_payment * 1000).floor / 1000.0
# announce monthly payment to user
prompt("your monthly payment is #{monthly_payment}") 

# Calculate amortized payment schedule
while num_payments < term
num_payments+= 1
n = (1 + rate_monthly)**num_payments - 1
balance = loan * (1 + rate_monthly)**num_payments - (monthly_payment * (n / rate_monthly) )
balance = (balance * 1000).floor / 1000.0
# print schedule to user
prompt(" your remaining balance is #{balance} after #{num_payments} payments made")
end

#thank you
prompt("thanks for using our calculator")