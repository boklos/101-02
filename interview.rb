# interview
# 5! = 5 x 4 x 3 x 2 x 1
# 7! = 7 x 6 x 5 x 4 x 3 x 2 x 1
# write a method that calculates the factorial sum of a number

#factorial_sum(4)
# 4! = 4 x 3 x 2 x 1 = 24
# 2 + 4 = 6

# => 6



def factorial(num)
  
  sum = 1
  (1..num).each { |n| sum *= n }
  sum
end

def factorial_sum(num)
  fact = factorial(num)
  
  
  result = factorial(num)
  sum = 0
  result.to_s.chars.map{|c| sum += c.to_i }
  sum
end

p factorial_sum(4) == 6
p factorial_sum(10) == 27   # (10! -> 3628800 -> 3+6+2+8+8+0+0 -> 27)
p factorial_sum(50) == 216  
p factorial_sum(100) == 648