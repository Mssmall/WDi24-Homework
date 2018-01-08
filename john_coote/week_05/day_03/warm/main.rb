# require "pry"
#
#
#
# alphabet_array = ("A" .. "Z").to_a
# tebahpla_array = alphabet_array.reverse
#
#
# input_string = "TEST"
# input_array = input_string.split("")
# output_array = []
#
# input_array.each do |letter|
#   i = alphabet_array.index(letter)
#   j = tebahpla_array[i]
#   output_array.push(j)
#
# end
#
#
# puts output_array.join("")
#
#   # binding.pry


require 'pry'

class Atbash

  def initiliaze input_string
    @input_string = input_string
    encode
  end

  def encode
    output = ""
    alphabet = ("A" .. "Z").to_a
    @input_string.split("").each do |letter|
      index = alphabet.index(letter)
      output << alphabet.reverse[index]
    end
  end

  return output 
end
