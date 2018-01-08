sum = 13
if sum > 10
  puts "yes, sum is greater than 10"
end


puts "yeah sure it's greater" if (sum > 10)


grade = "C"
# if grade == "A"
#   puts "boom"
# elsif grade == "B"
#   puts "OK"
# elsif grade == "C"
#   puts "pull up socks"
# end


# case grade
# when "A"
#   puts "A yea man"
# when "B"
#   puts "B OK"
# else
#   puts "hmm, more work required"
# end
#
# print "what is the password? "
password = gets.chomp
# # # password = password.chomp
# # puts " you think the password is #{password}."
#
# unless password == "swordfish"
#   puts "nope"
# end

puts "wrong password" unless password == "swordfish"
