def main_menu
  puts "(b) - basic calculator"
  puts "(a) - advanced calculator"
  puts "(q) - quit"


end

def prompt(message)
  print message
  gets.chomp #implicit return

end


def basic_calculator
  num1 = prompt("please enter the first number: ").to_i
  operator = prompt("please enter the first operator (+ - * /): ").chomp
  num2 = prompt("please enter the second number: ").to_i
  puts "*****************"
  puts case operator
  when "+"
    num1 + num2
  when "-"
    num1 - num2
  when "*"
    num1 * num2
  when "/"
    num1 / num2
  end
  puts "*****************"



end

def advanced_calculator
  num1 = prompt("please enter the first number: ").to_i
  operator = prompt("please enter the first operator (+ - * / ^ sqrt): ").chomp
  if operator != "sqrt"
    num2 = prompt("please enter the second number: ").to_i
  end

  puts "*****************"
  puts case operator
  when "+"
    num1 + num2
  when "-"
    num1 - num2
  when "*"
    num1 * num2
  when "/"
    num1 / num2
  when "^"
    num1 ** num2
  when "sqrt"
    num1 ** 0.5
  end
  puts "*****************"
end


############################################

main_menu
menu_choice = prompt("please enter an option: ").downcase

until menu_choice == "q"
  #show calc adv / basic
  case menu_choice
  when "b"
    basic_calculator
  when "a"
    advanced_calculator
  else
    puts "invalid selection"
  end

  main_menu
  menu_choice = prompt("please enter an option: ").downcase
end

puts "thanks for playing"
