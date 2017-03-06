# coin toss
	COIN = ["head","tail"].freeze
def coin()

	puts " Enter the coin toss number of times"	
	num = gets.chomp.to_i
	head_sum = 0
	tail_sum = 0
	num.times do |n|
		result = COIN.sample
		if result == "head"
			head_sum += 1
		else
			tail_sum += 1
		end
	end
	 head_sum
	 num
	 head_probabilty = (head_sum.to_f / num.to_f ) * 100 
	tail_probabilty = (tail_sum.to_f / num.to_f) * 100
	puts " you played #{num} times"
	puts " number of head was #{head_sum} and probabilty was #{head_probabilty} %"
	puts " number of tail was #{tail_sum} and probabilty was #{tail_probabilty} %"
end
coin()