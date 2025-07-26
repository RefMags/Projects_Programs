VALID_CHOICES = ["rock", "paper", "scissor"]
def prompt(message)
  puts "=>#{message}"
end

prompt("Hello! Welcome to the Rock,Paper and  Scissor Game!")

person_choice = ""
loop do
  prompt("Please select: #{VALID_CHOICES.join(', ')}.")
  person_choice = gets.chomp

  if VALID_CHOICES.include?(person_choice.downcase)
    break
  else
    prompt("That's not a valid choice. Please select again!")
  end
end

computer_choice = VALID_CHOICES.sample

prompt("You chose: #{person_choice}; Computer chose: #{computer_choice}")
