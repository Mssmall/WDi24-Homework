# 1. Drinking age?
#
# Ask the user for their age.
# Remember that anytime you get input, it is a string, so you will need to change the age input to a number.
# If age is less than 18, print an appropriate message.
# If the age is equal to or over 18, print a different message.

print "How old are you? "
age = gets.chomp.to_i


if age < 18
  puts " too young for beer"
else
  puts "let's drink"
end


# Air Conditioning
#
# Ask the user what the current temperature is, if the A/C is functional, and what temperature they wish it was.
# If the airconditioner is functional and the current temperature is above the the desired temperature... display "Turn on the A/C Please"
# If the airconditioner is non-functional and the current temperature is above the the desired temperature... display "Fix the A/C now! It's hot!"
# If the airconditioner is non-functional and the current temperature is below the the desired temperature... display "Fix the A/C whenever you have the chance... It's cool..."

print "What is the current temp? "
current_temp = gets.chomp.to_i

print "is the air con working? "
ac_working = gets.downcase[0]

print "What temp would you like? "
desired_temp = gets.chomp.to_i

if (ac_working == "yes") and (current_temp > desired_temp)
  puts "Turn on the AC please"
elsif (ac_working == "no")
  if (current_temp > desired_temp)
    puts "Turn on the AC please"
  elsif (current_temp < desired_temp)
    puts "chillax, it be cool"
  end
end





#
# 3. Sydney Suburbs
#
# Create a program that asks what suburbs you live in.
# Depending on the answer, print an appropriate response of your choosing

print "where do you live? "
suburb = gets.chomp.downcase

case suburb
  when "pennant hills"
    puts "#{suburb} = leafy"
  when "darlinghurst"
    puts "gritty"
  when "coogee"
    puts"beachy"
  when "cabramatta"
    puts "tasty"
  else
    puts "dunno"
end
