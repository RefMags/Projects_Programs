# What are the states for the instance of the classes
#
class Player
  attr_accessor :move

  def initialize(player_type)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper or scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "Sorry, invalid choice,"
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

class Move
  def initialize
    # of the choice a move object may be `paper`, `rock`, or `scissors`
  end
end

class Rule
  def initialize
    # what could be the state of a rule object?
  end
end

# Unsure where the mcompare goes, does the engine compare the moves, or the player does?
def compare(move1, move2)

end


class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to the Rock, Paper Scissor Game!"
  end

  # Display the WINNER
  def display_winner
    puts "You chose #{human.move}."
    puts "The computer chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "You won!" if computer.move == 'scissors'
      puts "Computer won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "You won!" if computer.move == 'rock'
      puts "Computer won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissor'
      puts "You won!" if computer.move == 'paper'
      puts "Computer won!" if computer.move == 'rock'
    end
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Good bye!"
  end

  # object required to play the game
  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
