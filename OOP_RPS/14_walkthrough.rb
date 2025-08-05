class Player
attr_accessor :move, :name

  def initialize(player_type)
    @player_type = player_type
    set_name
  end

  def set_name
    if human?
      answer_name = nil
      loop do
        puts "What's your name?"
        answer_name = gets.chomp
        break unless answer_name.empty?
        puts "Sorry, must enter a name!"
      end
      self.name = answer_name
    else
      self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Insert your move:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "Sorry, invalid choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end

end

class RPSGame
	attr_accessor :human, :computer

	def initialize
		@human = Player.new(:human)
		@computer = Player.new(:computer)
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
