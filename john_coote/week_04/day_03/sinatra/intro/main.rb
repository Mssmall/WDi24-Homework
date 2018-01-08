require "pry"
require "sinatra"
require "sinatra/reloader"


get '/hello' do
  "Hellow World!"
end

get '/' do
  "Hello World from the root"
end

get '/lucky_number' do
  "Your lucky number #{Random.rand(1..40).to_s}"
end

get "/fanclub/:name" do
  "#{params[:name].capitalize} is a member of the dynamic club"
end

get "/fanclub/:first/:last" do
  "#{ params[:first].capitalize} #{ params[:last].capitalize} is a silver memeber of the lcub"
end

get "/fanclub/:first/:last/:favorite" do
  "#{ params[:first].capitalize} #{ params[:last].capitalize} is a silver member of the lcub and their favorie thing is #{ params[:favorite]}"
end

get "/multiply/:x/:y" do
  result = params[:x].to_f * params[:y].to_f
  "the result is #{result}"
end
