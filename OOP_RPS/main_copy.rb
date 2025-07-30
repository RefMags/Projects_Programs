class Player
  attr_accessor :move

  def initialize(player_type= :human)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissor'].include? choice
        puts "Valid input, please choose from 'rock', 'paper', or 'scissor'"
      end
      self.move = choice
    else
      # initialize setter method to modify the move
      self.move = ['rock', 'paper', 'scissor'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

# Game Orchestration engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to the RPS game!"
  end

  def display_goodbye_message
    puts "Thank you for playing RPS game!"
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
