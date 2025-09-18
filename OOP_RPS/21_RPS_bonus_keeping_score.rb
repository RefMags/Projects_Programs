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

class Player
  attr_accessor :move, :name , :score

  def initialize
    set_name
    @score = 0
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

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.move} won!"
    else
      puts "It's a tie!"
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
    false if answer == 'n'
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
