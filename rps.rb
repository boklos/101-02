def prompt(message)
  puts("=>#{message}")
end

GAME = %w(rock  paper  scissors)

def win?(first, second)
	if (first == "rock" && (second == "scissors" || second == "lizard")) || (first == "scissors" &&
		(second == "paper" || second == "lizard")) || (first == "paper" && (second == "rock" || second == "spoke")) ||
		(first == "lizard" && (second == "paper" || second == "spoke")) || (first == "spoke" && (second == "scissors" || second == "rock"))
	end
end

loop do
def display_results(choice , computer_choice)
	if win?(choice , computer_choice)
		prompt(" You win")
	elsif win?(computer_choice , choice)
		prompt(" You loose")
	else
		prompt("It's a tie")
	end
end
choice = ''
loop do
	prompt(" Hello user please choose: #{GAME.join(', ')} p=>paper , r=> rock , l=>lizard, sc=>scissors , sp=>spoke")
	choice = gets.chomp
	if GAME.include?(choice)
		break
	else
		prompt(" please choose one of the 3 choices")
	end
end

computer_choice = GAME.sample

prompt(" you choose: #{choice} and the computer choose: #{computer_choice}")
display_results(choice, computer_choice)

prompt("do you want to play again ? choose yes/no")
answer = gets.chomp
break unless answer.start_with?("y")
end