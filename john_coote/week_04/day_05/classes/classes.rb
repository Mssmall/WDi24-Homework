require "pry"

class Actor
  def award_speech
    "I would lkke to thank my folks"
  end

  def deny_allegations
    "wasnt me"
  end
end

class Stooge < Actor

end

class MarxBrother < Actor
  attr_accessor :name, :instrument, :vice

  def initialize (name="someone", instrument=nil, vice=nil)
    @name = name
    @instrument = instrument
    @vice = vice
    puts "Marx created"
  end

end


groucho = MarxBrother.new "Groucho", "Banjo", "Cigars"

# groucho.name = "Groucho Julius Marx"
# groucho.instrument = "Guitar"
# groucho.vice = "Cigars"
# #
# harpo = MarxBrother.new
# harpo.name = "Harpo Marx"
# harpo.instrument = "Harpo"
# harpo.vice = "Mutism"



binding.pry
