class Player
  OPTIONS = ['rock', 'paper', 'scissor']
  attr_accessor :move

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    # a "name" ? how about a "move"(collaborator objects)
  end

  # 'choose' method is going to return a string
  def choose
    if human?
      choice = nil
      loop do
        # puts "Please choose #{OPTIONS.join(', ')}:"
        puts "Please choose rock,paper or scissor:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissor'].include? choice
        puts "Sorry, invalid choice!"
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissor'].sample
    end
  end

  def human?
    @player_type == :human
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

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end
  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
