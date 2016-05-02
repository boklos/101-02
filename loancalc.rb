def prompt(message)
  puts("=>#{message}")
end

def number_valid(num)
  num =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end
num_payments = 0


prompt (" welcom to car calculator")

price = ''
down = ''
  loop do
    prompt (" enter car price")
    price = Kernel.gets().chomp()

    if number_valid(price)
      break
    else
      prompt("please enter a valid value")
    end
end

loop do 
    prompt ("enter down payment value")
    down = Kernel.gets().chomp()
    if number_valid(down)
      break
    else
      prompt("please enter a valid value")
    end
end
  
loan = price.to_f - down.to_f
prompt ("your loan amount is #{loan}")

rate = ''
loop do 
    prompt ("enter interest rate from 0 to 30")
    rate = Kernel.gets().chomp()
    if number_valid(rate)
      break
    else
      prompt("please enter a valid value")
    end
end

rate_monthly = (rate.to_f/100)/12

term = ''
loop do 
    prompt ("enter number of months")
    term = Kernel.gets().chomp()
    if number_valid(term)
      break
    else
      prompt("please enter a valid value")
    end
end

term = term.to_i



monthly_payment = loan*(rate_monthly*(1 + rate_monthly)**term)/((1+ rate_monthly)**term - 1)

monthly_payment = (monthly_payment * 1000).floor / 1000.0
prompt("your monthly payment is #{monthly_payment}") 

while num_payments < term

num_payments+= 1

n = (1 + rate_monthly)**num_payments - 1

balance = loan * (1 + rate_monthly)**num_payments - (monthly_payment * (n / rate_monthly) )
balance = (balance * 1000).floor / 1000.0

prompt(" your remaining balance is #{balance} after #{num_payments} payments made")

end