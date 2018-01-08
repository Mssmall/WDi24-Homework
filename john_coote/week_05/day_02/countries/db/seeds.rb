# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
# CREATE TABLE countries (
#   name TEXT,
#   population INTEGER,
#   capital TEXT
#   cups INTEGER
# )


# Planet.destroy_all
#
# Planet.create :name => 'Earth', :orbit => 1, :moons => 1

Country.destroy_all

Country.create :name => 'Australia', :population => 20, :capital => 'Canberra', :cups => 0
Country.create :name => 'New Zealand', :population => 4, :capital => 'Auckland', :cups => 0
Country.create :name => 'England', :population => 55, :capital => 'London', :cups => 1
Country.create :name => 'Brazil', :population => 80, :capital => 'Brasilia', :cups => 5
