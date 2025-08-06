class Player
attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    answer_name = nil
    loop do
      puts "What's your name?"
      answer_name = gets.chomp
      break unless answer_name.empty?
      puts "Sorry, must enter a name!"
    end
    self.name = answer_name
  end

  def choose
    choice = nil
    loop do
      puts "Insert your move:"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include? choice
      puts "Sorry, invalid choice."
    end
    self.move = choice
  end

end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end
end

class RPSGame
	attr_accessor :human, :computer

	def initialize
		@human = Human.new
		@computer = Computer.new
	end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissor!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, and Scissors. Good bye!"
  end

  def display_winner
    puts "#{human.name} choose #{human.move}."
    puts "#{computer.name} choose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?(y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
        puts "Sorry, must be y or n"
      end

      true if answer == 'y'
      return false
  end

	def play
		display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
		display_goodbye_message
	end
end

# instantiate of RPS game and call a method on it
RPSGame.new.play
