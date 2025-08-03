class Owner
  attr_reader :pets

  def initialize
    @pets = []
  end

  def adopt(name)
    pets << Pet.new(name)
  end

  def findPet(name)
    idx = pets.find_index { |pet| pet.name == name }
    if idx
      pets[idx]
    else
      "No pet found"
    end
  end
end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

owner = Owner.new
owner.adopt("Fido")
owner.adopt("Matt")
p owner.pets
p owner.findPet("Fido")
p owner.findPet("Spot")

# class Player
#   attr_accessor :move

#   def initialize
#     @move = nil
#   end

#   def choose
#     self.move = ["Rock", "Paper", "Scissors"].sample
#   end
# end

# computer = Player.new
# p computer.choose
# p computer.move

# class Move
#   attr_accessor :values

#   VALUES = ["Rock", "Paper", "Scissors"]

#   def initialize(value)
#     @value = value
#   end
# end

# # possible_moves = Move.new("Rock")
# # p possible_moves.value
