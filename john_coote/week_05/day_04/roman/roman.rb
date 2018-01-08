require "pry"

class Roman

  def initialize input
    @input = input.to_i
    convert
  end


  def convert

    ms = (@input - (@input % 1000))/1000
    remainder = @input - (ms * 1000)
    ms.times {print "M"}

    cs = (remainder - (remainder % 100))/100
    remainder = remainder - (cs * 100)
    if (cs == 9)
      print "CM"
    else
      cs.times {print "C"}
    end

    xs = (remainder - (remainder % 10))/10
    remainder = remainder - (xs * 10)
    xs.times {print "X"}
    if (xs == 9)
      print "XC"
    else
      xs.times {print "X"}
    end

    is = (remainder - (remainder % 1))/1
    remainder = remainder - (is * 1)
    if (is == 9)
      print "IX"
    elsif (is > 5)
      print "V"
      remainder = remainder - 5
      is.times {print "I"}
    elsif (is == 5)
      print "V"
    elsif (is == 4)
    print "IV"
    else
      is.times {print "I"}
    end
    # is.times {print "I"}

    puts ""
    puts @input
    # puts "thousands: " + ms.to_s
    # puts "hundreds: " + cs.to_s
    # puts "tens: " + xs.to_s
    # puts "units: " + is.to_s


  end

end


test = Roman.new(1909)
test = Roman.new(1990)
test = Roman.new(2008)
test = Roman.new(1905)
test = Roman.new(1904)
