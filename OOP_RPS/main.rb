class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Move
  def initialize
    # somthing we need to track
    #  of the choice... a move object like `paper`,`rock` or `scissor`
  end
end

def Rule
  def initialize
    # uncertain of what the state should be
  end
end


# not sure where 'compare' goes yet
def compare(move1, move2)

end

class Human < Player

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      # puts "Please choose #{OPTIONS.join(', ')}:"
      puts "Please choose rock,paper or scissor:"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissor'].include? choice
      puts "Sorry, invalid choice!"
    end
    self.move = choice
  end

end

class Computer < Player

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissor'].sample
  end

end


# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}!"
    puts "#{computer.name} chose #{computer.move}!"

    # the player object.move returns a string
    case human.move
    when "rock"
      puts "It's a tie!" if computer.move == "rock"
      puts "#{human.name} won!" if computer.move == "scissor"
      puts "#{computer.name} won!" if computer.move == "paper"
    when "paper"
      puts "It's a tie!" if computer.move == "paper"
      puts "#{human.name}  won!" if computer.move == "rock"
      puts "#{computer.name} won!" if computer.move == "scissor"
    when "scissor"
      puts "It's a tie!" if computer.move == "scissor"
      puts "#{human.name}  won!" if computer.move == "paper"
      puts "#{computer.name} won!" if computer.move == "rock"
    end
  end


  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end

    return true if answer == 'y'
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

RPSGame.new.play
