def prompt(message)
  puts("=>#{message}")
end

GAME = %w(rock  paper  scissors lizard spoke)

def shorten_input(input)
	case input
	when "p" , "P" , "paper"
	  input = "paper"
	when "r", "R" , "rock"
	  input = "rock"
	when "l" , "L" , "lizard"
	  input = "lizard"
	when "sc" , "Sc" , "SC" , "scissors"
	  input = "scissors"
	when "sp" , "Sp" , "SP" , "spoke"
	  input = "spoke"
	end
end


score = 0

def get_score()
	score += 1
end



def win?(first, second)
<<<<<<< HEAD
	 (first == "rock" && (second == "scissors" || second == "lizard")) || (first == "scissors" &&
		(second == "paper" || second == "lizard")) || (first == "paper" && (second == "rock" || second == "spoke")) ||
		(first == "lizard" && (second == "paper" || second == "spoke")) || (first == "spoke" && (second == "scissors" || second == "rock"))
	
=======
	if ((first == "rock" && ((second == "scissors" || second == "lizard"))) || (first == "scissors" &&
		((second == "paper" || second == "lizard"))) || (first == "paper" && ((second == "rock" || second == "spoke"))) ||
		(first == "lizard" && ((second == "paper" || second == "spoke"))) || (first == "spoke" && ((second == "scissors" || second == "rock"))))
	end
>>>>>>> 3c2146e71c324ef9d708f0d4882df55a7da63526
end

loop do
def display_results(choice , computer_choice)
	if win?(choice , computer_choice)
		#get_score
		prompt(" You win")
	elsif win?(computer_choice , choice)
		prompt(" You loose")
	else
		prompt("It's a tie")
	end
end

choice = ''
loop do
	prompt(" Hello user please choose: #{GAME.join(', ')} OR choose abbreviation: p=>paper , r=> rock , l=>lizard, sc=>scissors , sp=>spoke")
	choice = gets.chomp

	if GAME.include?(shorten_input(choice))
		break
	else
		prompt("please type full word from the 5 choices or choose an abreviation")
	end
end

computer_choice = GAME.sample

prompt(" you choose: #{shorten_input(choice)} and the computer choose: #{computer_choice}")
display_results(choice, computer_choice)

prompt("do you want to play again ? choose yes/no")
answer = gets.chomp
break unless answer.start_with?("y")
end
