# Activity:
#
# You are to generate a basic "guess my number" game. The computer will pick a random number between 0 and 10. The user will guess the number until they guess correctly.
# Specification:
#
# The user should be asked to guess a number
# If the user's guess is correct, the user should see a congratulatory message
# If the user's guess is not correct, the user should be asked to guess the number again.
# Extensions:
#
# Let the user choose the maximum value (so they can play a long game with a random value between 0 and 10000, for example).
# Give feedback to the user: "Wrong, guess higher!" or "Wrong, guess lower!"

rand_num = Random.rand(1..10)

puts "rand_num = #{rand_num}"

print "enter your guess: "
guess = gets.to_i

while guess != rand_num
  if guess < rand_num
    print "#{guess} is too low. try again: "
  else
    print "#{guess} is too high. try again: "
  end
  guess = gets.to_i
end


puts "success. the number is #{rand_num}"
