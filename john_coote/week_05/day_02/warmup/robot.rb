require "pry"

class Robot
  attr_accessor :name, :instruction_count, :boot_timer

  # def initialize(name='Somebody Marx', instrument=nil, vice=nil)
  #   @name = name
  #   @instrument = instrument
  #   @vice = vice
  # end

  def random_name_generator
    letter_array = ("A" .. "Z").to_a
    three_letters = letter_array.shuffle.pop(3).join("")
    three_numbers = (1..9).to_a.shuffle.pop(3).join("")
    result = three_letters + three_numbers
  end


  def initialize(name='Wall-E', instruction_count=0, boot_timer=0)
    @name = random_name_generator
    @instruction_count = 0
    @boot_timer = 0
  end


  def reset
    @name = random_name_generator
    @instruction_count = @instruction_count + 1
    @boot_timer = 0
    puts @name
    puts @instruction_count
    puts @boot_timer
  end

end

asimov = Robot.new

puts asimov.name
# puts asimov.@boot_timer
# puts asimov.@create_timer
puts asimov.instruction_count
puts asimov.boot_timer

binding.pry
