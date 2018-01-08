require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require "pry"


get "/" do
  "we are connected, but there's nothing at this location."
end

get "/planets" do
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true

  @planets = db.execute "SELECT * FROM planets"
  #binding.pry
  db.close

  erb :planets
end

get "/planet/:id" do

  # get info for a particular planet as a variable
  # send this variable to the erb page for display.
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true

  @planet = db.execute "SELECT * FROM planets WHERE id=" + params[:id]
  @planet = @planet.first

  #binding.pry
  db.close
  erb :planet
end

get "/planet/edit/:id" do
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true

  @planet = db.execute "SELECT * FROM planets WHERE id=" + params[:id]
  #binding.pry
  @planet = @planet.first
  db.close
  erb :edit
end


post "/planet/:id" do
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true

  update = "UPDATE planets SET name='#{params[:name]}', radius=#{params[:radius]}, period=#{params[:period]}, image='#{params[:image]}' WHERE id=#{params[:id]}"

  db.execute update
  db.close
  # puts update
  # binding.pry

  redirect to("planet/#{params[:id]}")

end



get "/planets/add" do
  # erb :add
  # "helooooo"
  erb :add
end

post "/planets/add" do
  db = SQLite3::Database.new "database.sqlite3"
  db.results_as_hash = true

  insert_into = "INSERT INTO planets (name, radius, period) VALUES (" + "'" + params[:name]+ "'" + ", " + params[:radius] + ", " + params[:period] +");"

  db.execute insert_into
  db.close

  #binding.pry

  redirect to ("/planets")
end


#
# # INDEX - show all the butterflies
# get '/butterflies' do
#   @butterflies = query_db "SELECT * FROM butterflies"
#
#   erb :butterflies_index
# end


#
# def query_db(sql_statement)
#   db = SQLite3::Database.new 'database.sqlite3'
#   db.results_as_hash = true
#
#   puts sql_statement
#
#   results = db.execute sql_statement
#   db.close
#
#   results # implicit return
#
# end
