require "pry"
require 'sinatra'
require 'sinatra/reloader'


require 'stock_quote'
# @stock_symbol = 'MSFT' # in your code: params[:stock_symbol]
# @last_price = StockQuote::Stock.quote(@stock_symbol).l

get '/' do
  erb :home
end

get '/results' do
  redirect to('/') if params[:symbol].empty?

  @symbol = params[:symbol]
  @price = StockQuote::Stock.quote(@symbol).l


  teams = ""
  man_array = StockQuote::Stock.quote(@symbol).management



  # man_array.each { |i|
  #   teams = teams + man_array[i]['name'] + ", " + man_array[i]['title'] + "<br>"
  # }
  # # end

# man_array.each do |i|
#   teams = "number #{i} <br>"
# end


  @teams = teams



  @main_man = StockQuote::Stock.quote(@symbol).management[0]['name']
  @main_title = StockQuote::Stock.quote(@symbol).management[0]['title']




  erb :results
end
