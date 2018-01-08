require "pry"

print "Please enter a string: "
test_string = gets.chomp
test_array = test_string.split('')

nucleo_string = "TACGU"
nucleo_array = nucleo_string.split('')

total_nucelos = 0

#binding.pry
nucleo_array.each do |letter_n|
  puts letter_n
  puts "Count of " + letter_n + " = " + test_array.count(letter_n).to_s
  total_nucelos = total_nucelos + test_array.count(letter_n)
end

#puts total_nucelos
puts
puts "************************************************************"
puts "Sorry, this string has no nucelotides" if total_nucelos == 0
puts "The total number of nucleotides in this string is  = " + total_nucelos.to_s if total_nucelos > 0
puts "************************************************************"
puts
