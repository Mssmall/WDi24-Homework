# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Artist.destroy_all
# Artist.create(:name => 'Joan Miro', :nationality => 'Spanish', :dob => '1893/04/20', :period => '20th century', :image => 'http://upload.wikimedia.org/wikipedia/commons/5/5c/Portrait_of_Joan_Miro%2C_Barcelona_1935_June_13.jpg')
#
# Work.destroy_all
# Work.create(:title => 'The Flight of the Dragonfly in Front of the Sun', :year => '1968', :medium => 'oil on canvas', :style => 'Abstract Art', :image => 'https://uploads0.wikiart.org/images/joan-miro/the-flight-of-the-dragonfly-in-front-of-the-sun.jpg')

# Table name: countries
#  id         :integer          not null, primary key
#  name       :text
#  population :integer
#  capital    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Table name: cities
#  id         :integer          not null, primary key
#  name       :text
#  population :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :integer
#
Country.destroy_all
Country.create(:name => "Australia", :population => 200, :capital => "Canberra")
Country.create(:name => "England", :population => 200, :capital => "London")

City.destroy_all
City.create(:name => "London", :population => 250)
City.create(:name => "Sydney", :population => 220)
