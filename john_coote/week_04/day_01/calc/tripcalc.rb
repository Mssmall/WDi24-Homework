def prompt(message)
  print message
  gets.chomp #implicit return

end


def enter_data
  distance = prompt("enter the distance trasvelled: ").to_i
  litresper100 = prompt("enter the litres per 100km: ").to_f
  priceperlitre = prompt("enter the price per litre: ").to_f

  dollars = (litresper100 / 100 * distance * priceperlitre).round(2)

  puts "*************************"
  puts "*** Total Cost $#{dollars} ***"
  puts "*************************"
end

def main_menu
  puts "(a) - calculate trip costs"
  puts "(q) - quit"
end



############################################

main_menu
menu_choice = prompt("please enter an option: ").downcase

until menu_choice == "q"
  case menu_choice
  when "a"
    enter_data
  else
    puts "invalid selection"
  end

  main_menu
  menu_choice = prompt("please enter an option: ").downcase

end

puts "thanks for playing"
