# What are the states for the instance of the classes
#
class Player
  def initialize
    # a `@name` , `@move`,
  end

  def choose

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
    @human = Player.new
    @computer = Player.new
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
