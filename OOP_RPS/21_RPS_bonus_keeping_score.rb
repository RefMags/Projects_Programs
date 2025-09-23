class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def rock?
    @value = "rock"
  end

  def paper?
    @value = "paper"
  end

  def scissors?
    @value = "scissors"
  end

  def >(other_value)
    (rock? && other_value.scissors?) ||
      (paper? && other_value.rocks?) ||
      (scissor? && other_value.paper)
  end

  def <(other_value)
    (rock? && other_value.paper?) ||
      (paper? && other_value.scissors?) ||
      (scissor? && other_value.rock)
  end

  def to_s
    @value
  end
end

class Score
  attr_reader :value
  THRESHOLD = 10

  def initialize
    @value = 0
  end

  def increase(points)
    @value += points
  end

  def value
    @value
  end

  def winning_score_reached?
    @value >= THRESHOLD
  end

  def reset
    @value = 0
  end
end

class Player
  attr_accessor :move, :name , :score

  def initialize
    set_name
    @score = Score.new
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
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end


class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
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

  def display_move
    puts "#{human.name} chose #{human.move}!"
    puts "#{computer.name} chose #{computer.move}!"
  end

  def update_score
    # Use the winner from the `evaluated_move`
    # increment the score of the winner (human or computer)
    winner = evaluate_move
    winner.score.increase(2) if winner
    winner
  end

  def evaluate_move
    # determine the winner based on the move comparison
    if human.move > computer.move
     human
    elsif human.move < computer.move
      computer
    else
      nil
    end
  end

  def display_winner
    if update_score != nil
      puts "The round winner is: #{update_score.name.capitalize}"
    else
      puts "Its a tie"
    end
  end

  def display_match_score
     puts "The scores are; #{human.name}: #{human.score.value} and #{computer.name}: #{computer.score.value}"
  end

  def grand_winner_score?
    winner = update_score
    winner.score.winning_score_reached?
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?(y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n"
    end

    true if answer == 'y'
    false if answer == 'n'
  end

  def play_match # round play
    loop do
      human.choose
      computer.choose
      display_move
      update_score
      display_winner
      display_match_score
      break unless grand_winner_score? # => to pick up here
    end
    #
  end

  def play
    display_welcome_message
    loop do
      play_match
      # diplay_grand_winner
      break unless play_again?
      human.score.reset
      computer.score.reset
    end
    display_goodbye_message
  end
end

# instantiate of RPS game and call a method on it
RPSGame.new.play
