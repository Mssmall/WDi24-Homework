User.destroy_all
user1 = User.create :email => "john_coote@rocketmail.com", :password => "chicken"
user2 = User.create :email => "tinny@honcoote.com", :password => "chicken"

Song.destroy_all
song1 = Song.create :title => "Be True to Your School"
song2 = Song.create :title => "Warpigs"
song3 = Song.create :title => "The Eliminator"

Album.destroy_all
album1 = Album.create :title => "More crap by the Beach Boys"
album2 = Album.create :title => "Paranoid"
album3 = Album.create :title => "Maserati VI"

Artist.destroy_all
artist1 = Artist.create :name => "The Beach Boys"
artist2 = Artist.create :name => "Black Sabbath"
artist3 = Artist.create :name => "Maserati"

Genre.destroy_all
genre1 = Genre.create :name => "Surf Music"
genre2 = Genre.create :name => "OSBHM"
genre3 = Genre.create :name => "Cool Grooves"

Mixtape.destroy_all
mixtape1 = Mixtape.create :title => "Coding Music"
mixtape2 = Mixtape.create :title => "Music to walk the dog to"


artist1.songs << song1
artist2.songs << song2
artist3.songs << song3

album1.songs << song1
album2.songs << song2
album3.songs << song3

song1.genres << genre1
song2.genres << genre1 << genre2
song3.genres << genre3

mixtape1.songs << song1 << song2 << song3
mixtape2.songs << song1 << song2 << song3

user1.mixtapes << mixtape1
user2.mixtapes << mixtape2
