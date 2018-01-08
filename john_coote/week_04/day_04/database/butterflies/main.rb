require "sinatra"
require "sinatra/reloader"
require "pry"
require "sqlite3"

get "/" do
  erb :home
end

# INDEX - show all the butterflies
get '/butterflies' do
  @butterflies = query_db "SELECT * FROM butterflies"

  erb :butterflies_index
end

#new action
get "/butterflies/new" do
  erb :butterflies_new
end

#create action - adds a anew butterfly to database
post '/butterflies' do
  db = SQLite3::Database.new 'database.sqlite3'

  db.execute "INSERT INTO butterflies (name, family, image) VALUES ('#{ params['name']}', '#{params['family']}', '#{params['image']}')"
  redirect to ('/butterflies') #get request
end


#show individual page
get "/butterflies/:id" do
  # fetch datbase info
  @butterfly = query_db "SELECT * FROM butterflies WHERE id = " + params[:id]

  #SQL lite gem always returns an array.
  # need to extr6act single butterfl;y array
  @butterfly = @butterfly.first #strips away array

  erb :butterflies_show
end


# # Edit: Shows the existing values for a single butterfly for editing.
# get '/butterflies/:id/edit' do
#   @butterfly = query_db('SELECT * FROM butterflies WHERE id = ' + params[:id]).first
#   erb :butterflies_edit
# end
#
get "/butterflies/:id/edit" do
  @butterfly = query_db('SELECT * FROM butterflies WHERE id =' + params[:id]).first
  erb :butterflies_edit
end

# # Update: Updates an existing butterfly in the database with new information.
# post '/butterflies/:id' do
#   update = "UPDATE butterflies SET name='#{ params[:name] }', family='#{ params[:family] }', image='#{ params[:image] }' WHERE id = #{ params[:id] }"
#   query_db update
#   redirect to("/butterflies/#{ params[:id] }")
# end
post '/butterflies/:id' do
  update = "UPDATE butterflies SET name='#{params[:name]}', family =' #{params[:family]}', image='#{params[:image]}' WHERE id = #{params[:id]}"
  query_db update
  redirect to("/butterflies/#{params[:id]}")
end


# # Destroy: Deletes the butterfly with the provided ID from the database
# get '/butterflies/:id/delete' do
#   query_db 'DELETE FROM butterflies WHERE id = ' + params[:id]
#   redirect to('/butterflies')
# end
#destroy action - deletes record
get "/butterflies/:id/delete" do
  query_db 'DELETE FROM butterflies WHERE id =' + params[:id]
  redirect to('/butterflies')
end



def query_db(sql_statement)
  db = SQLite3::Database.new 'database.sqlite3'
  db.results_as_hash = true

  puts sql_statement

  results = db.execute sql_statement
  db.close

  results # implicit return

end
