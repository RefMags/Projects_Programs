# Question​​: Explain the difference between `public`, `private`, and `protected` method access control in Ruby. Then, write a small code example demonstrating the behavior of a `private` method.

# class Student
#   attr_reader :name, :grade

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def change_grade(mark)
#     self.grade = mark
#   end

#   private
#   attr_writer :grade
# end

# jon = Student.new('Jon', 0)
# jon.grade = 50
# p jon.grade
#
#
=begin

P: Given a number, find its a prime number or not
  Input: positive integer
  Output: boolean (prime or not prime)

  a prime: divisible by one and itself only, 1 is not a prime number

Example:
- An array of numbers up to 9 [1, 2, 3, 4, 5, 6, 7, 8, 9];
collect all numbers whose remainder is 0 if divided with the arg.

eg: arg = 1: arg % 1 = 0 ;  false or return false if arg is 1
arg = 2; number divisible to 2 : [1, 2]


=end

def is_prime(int)
  # return false for 1 passed as arg
  # return true if arg is 2
  # create a range of number up to the int
  # Find all numbers that are evenly divisible by the number:
  # IF any number in the range(less the num) is evenly divisible
    # return false
    # else true, than none of the numbers is evenly divisible by arg.
    #
  false if int == 1

  (2...int).any? do |divisor|
    return false if int % divisor == 0
  end

  return true
end

puts is_prime(1) #== true               # true
puts is_prime(2) #== true               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true
