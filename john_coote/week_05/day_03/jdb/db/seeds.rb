# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Country.destroy_all
# Country.create(:name => "Australia", :population => 200, :food => "Lamingtons")
# Country.create(:name => "England", :population => 300, :food => "Gooseberries")
# Country.create(:name => "New Zealand", :population => 30, :food => "Chinese Gooseberries")
# Country.create(:name => "USA", :population => 301, :food => "BBQ")

City.destroy_all
City.create(:name => "London", :population => 250, :country_id => 5)
City.create(:name => "Birmingham", :population => 250, :country_id => 5)
City.create(:name => "Sydney", :population => 220, :country_id => 4)
City.create(:name => "Melbourne", :population => 220, :country_id => 4)
City.create(:name => "Auckland", :population => 220, :country_id => 6)
City.create(:name => "New York", :population => 220, :country_id => 4)

#
# 4|Australia|200|Lamingtons||2017-11-22 21:27:57.416888|2017-11-22 21:27:57.416888
# 5|England|300|Gooseberries||2017-11-22 21:27:57.420669|2017-11-22 21:27:57.420669
# 6|New Zealand|30|Chinese Gooseberries||2017-11-22 21:27:57.423608|2017-11-22 21:27:57.423608
# 7|USA|301|BBQ||2017-11-22 21:27:57.426783|2017-11-22 21:27:57.426783
