User.destroy_all
u1 = User.create :email => 'craigsy@ga.co'
u2 = User.create :email => 'jonesy@ga.co'

Song.destroy_all
s1 = Song.create :title => 'Have A Safe Trip, Dear'
s2 = Song.create :title => 'All By Electricity'
s3 = Song.create :title => "Don't Ask Me To Dance"

Album.destroy_all
a1 = Album.create :title => 'Engine Takes To The Water'
a2 = Album.create :title => 'The Last Romance'
a3 = Album.create :title => 'The Shipping News'

Artist.destroy_all
r1 = Artist.create :name => 'June of 44'
r2 = Artist.create :name => 'Shipping News'
r3 = Artist.create :name => 'Arab Strap'

Genre.destroy_all
g1 = Genre.create :name => 'Nautical Text Rock'
g2 = Genre.create :name => 'Nautical Math Rock'
g3 = Genre.create :name => 'Folk Rock'
g4 = Genre.create :name => 'Scotch Misery'

Mixtape.destroy_all
m1 = Mixtape.create :title => 'Driving Songs'
m2 = Mixtape.create :title => 'Makeout Music'
m3 = Mixtape.create :title => 'Code Jams'

a1.songs << s1
a2.songs << s3
a3.songs << s2

r1.songs << s1
r2.songs << s2
r3.songs << s3

s1.genres << g1
s2.genres << g1 << g2
s3.genres << g3 << g4

m1.songs << s1 << s2 << s3 << s1
m2.songs << s2 << s3
m3.songs << s2

u1.mixtapes << m1 << m2
u2.mixtapes << m3
