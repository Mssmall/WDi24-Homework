require 'pry'

# A. Given the following data structure:
#
# a = ["Anil", "Erik", "Jonathan"]
# How would you return the string "Erik"?
# How would you add your name to the array?


a = ["Anil", "Erik", "Jonathan"]
b = a[1]
a.push("John")


#
# B. Given the following data structure:
#
# h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}
# How would you return the string "One"?
# How would you return the string "Two"?
# How would you return the number 2?
# How would you add {3 => "Three"} to the hash?
# How would you add {:four => 4} to the hash?

h = {0 => "Zero", 1 => "One", :two => "Two", "two" => 2}

p h[1]
p h[:two]
p h["two"]
h[3]='three'
h[:four] = 4
# h.merge( {:name => 'fred'}) is an alt method
p h

# C. Given the following data structure:
#
# is = {true => "It's true!", false => "It's false"}
# What is the return value of is[2 + 2 == 4]?
# What is the return value of is["Erik" == "Jonathan"]?
# What is the return value of is[9 > 10]?
# What is the return value of is[0]?
# What is the return value of is["Erik"]?

is = {true => "It's true!", false => "It's false"}

p is[2 + 2 == 4] #true.
p is["Erik" == "Jonathan"] # false
p is[9 > 10] # false.
p is[0] # nil
p is["Erik"] # nil



# D. Given the following data structure:

users = {
  "Jonathan" => {
    :twitter => "tronathan",
    :favorite_numbers => [12, 42, 75],
  },
  "Erik" => {
    :twitter => "sferik",
    :favorite_numbers => [8, 12, 24],
  },
  "Anil" => {
    :twitter => "bridgpal",
    :favorite_numbers => [12, 14, 85],
  },
}

# How would you access Jonathan's Twitter handle (i.e. the string "tronathan")?
# How would you add the number 7 to Erik's favorite numbers?
# How would you add yourself to the users hash?
# How would you return the array of Erik's favorite numbers?
# How would you return the smallest of Erik's favorite numbers?
# How would you return an array of Anil's favorite numbers that are also even?
# How would you return an array of the favorite numbers common to all users?
# How would you return an array containing all users' favorite numbers, sorted, and excluding duplicates?


p users['Jonathan'][:twitter]
users['John']= {}
p users['Erik'][:favorite_numbers]
p users['Erik'][:favorite_numbers].sort.shift
p users['Anil'][:favorite_numbers].select{|i| i.even?}
p users['Jonathan'][:favorite_numbers] &  users['Erik'][:favorite_numbers] &  users['Anil'][:favorite_numbers]
p (users['Jonathan'][:favorite_numbers] |  users['Erik'][:favorite_numbers] |  users['Anil'][:favorite_numbers]).sort




binding.pry
