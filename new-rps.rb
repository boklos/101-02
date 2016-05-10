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


$score_player = []
$score_pc = []

def add_score(side)
	if side.length < 5
		side << 1
	end	
end



def win?(first, second)
	 (first == "rock" && (second == "scissors" || second == "lizard")) || (first == "scissors" &&
		(second == "paper" || second == "lizard")) || (first == "paper" && (second == "rock" || second == "spoke")) ||
		(first == "lizard" && (second == "paper" || second == "spoke")) || (first == "spoke" && (second == "scissors" || second == "rock"))
	
end

loop do
def display_results(newchoice , computer_choice)
	if win?(newchoice , computer_choice)
		add_score($score_player)
		prompt(" You win")
	elsif win?(computer_choice , newchoice)
		add_score($score_pc)
		prompt(" You loose")
	else
		prompt("It's a tie")
	end
end

choice = ''
newchoice=''
loop do
	prompt(" Hello user please choose: #{GAME.join(', ')} OR choose abbreviation: p=>paper , r=> rock , l=>lizard, sc=>scissors , sp=>spoke")
	choice = gets.chomp
	newchoice = shorten_input(choice)
	if GAME.include?(newchoice)
		break
	else
		prompt("please type full word from the 5 choices or choose an abreviation")
	end
end

computer_choice = GAME.sample

prompt(" you choose: #{newchoice} and the computer choose: #{computer_choice}")
display_results(newchoice, computer_choice)

if $score_pc.length >= 5
	prompt("PC reached 5 points and finished the game")
	break
elsif $score_player.length >= 5 
	prompt("you reached 5 points and finished the game")
	break	
end

prompt("do you want to play again ? choose yes/no")
answer = gets.chomp
break unless answer.start_with?("y")
end