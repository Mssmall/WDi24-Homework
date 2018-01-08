require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

ActiveRecord::Base.logger  = Logger.new(STDERR)

class Parent < ActiveRecord::Base
end
class Child < ActiveRecord::Base
end

get '/' do
  erb :home
end

# update section for parents.
post '/' do
  @start = params[:start]
  @destination = params[:destination]

  @string_trip = calculate_trip(@start, @destination)

  @start1 = @start + " train station, " + @start + " NSW"
  @destination1 = @destination + " train station, " + @destination + " NSW"

  @gAPIKey = "AIzaSyB7nJABK2HEiQKo4V-FCEMWX5xag8vVJeA"
  @gmapURL1 = "https://www.google.com/maps/embed/v1/directions?key=" + @gAPIKey + "&origin=" + @start1 + "&destination=" + @destination1 + "&mode=transit&zoom=12"

# 
# https://www.google.com.au/maps/dir/Sydney+Town+Hall,+483+George+St,+Sydney+NSW+2000/Hornsby,+New+South+Wales+2077/@-33.8002761,151.0686258,12z/data=!3m1!4b1!4m17!4m16!1m5!1m1!1s0x6b12ae3c27682c85:0xb1663d1d054300f6!2m2!1d151.2061157!2d-33.8731575!1m5!1m1!1s0x6b12a7c5ba29900d:0x5017d681632bae0!2m2!1d151.09901!2d-33.7049!2m2!4e2!5e2!3e3



erb :trip_show

  # document.querySelectorAll('.thomas').append("123")
  # document.getElementById('output1').innerHTML = "<h1>" + strResults + "</h1>";



  # "code here for trip calculations. start = " + @start + ", destination = " + @destination
  # string_trip
end


# index - show all parents
get '/parents' do
  @parents = Parent.all
  erb :parents_index
end

# index - show all children
get '/children' do
  @children = Child.all
  erb :children_index
end

# make a new parent
get '/parents/new' do
  erb :parents_new
end

# info page on single parent
get '/parents/:id' do
  @parent = Parent.find params[:id]
  @children = Child.all

  @mapref = @parent.mapref
  if @mapref.nil?
    @mapref = "0,0"
  end
  @fav_rest_mapref = @parent.fav_rest_mapref
  if @fav_rest_mapref.nil?
    @fav_rest_mapref = "0,0"
  end
  @gAPIKey = "AIzaSyB7nJABK2HEiQKo4V-FCEMWX5xag8vVJeA"
  @gmapURL = "https://www.google.com/maps/embed/v1/directions?key=" + @gAPIKey + "&origin=" + @mapref + "&destination=" + @fav_rest_mapref + "&mode=walking&zoom=18"

  erb :parents_show
end

# edit page for parents
get '/parents/:id/edit' do
  @parent = Parent.find params[:id]
  erb :parents_edit
end

# update section for parents.
post '/parents/:id' do
  parent = Parent.find params[:id]
  parent.update :name => params[:name], :mapref => params[:mapref], :image => params[:image], :fav_rest => params[:fav_rest], :fav_rest_img => params[:fav_rest_img], :fav_rest_mapref => params[:fav_rest_mapref]
  redirect to("/parents/#{params[:id]}")
end




################################
#
# class Station
#   attr_accessor :name, :connections
#
#   def initialize(name='', connections=[])
#     @name = name
#     @connections = connections
#   end
#
# end
#
# @parents.each do |parent
#   @children.each do |child|
#     if child.parent_id == @parent.id
#       conn_arr = conn_arr.push(child.name)
#     end
#   end
#   THISNAME = parent.name
#   THISNAME = Station.new
#
#   THISNAME.name = parent.name
#   THISNAME.connections = conn_arr
#
# end



def calculate_trip(start, destination)

@stations = {
  'Hornsby' => {
    :name => 'Hornsby',
    :connections => ['Epping', 'Chatswood', 'Brooklyn']
  },
  'Epping' => {
    :name => 'Epping',
    :connections => ['Hornsby', 'Chatswood', 'Strathfield']
  },
  'Chatswood' => {
    :name => 'Chatswood',
    :connections => ['Hornsby', 'Epping', 'Central']
  },
  'Strathfield' => {
    :name => 'Strathfield',
    :connections => ['Lidcombe', 'Epping', 'Central']
  },
  'Bankstown' => {
    :name => 'Bankstown',
    :connections => ['Sydneham', 'Liverpool','Lidcombe']
  },
  'Liverpool' => {
    :name => 'Liverpool',
    :connections => ['Blacktown', 'Bankstown','Lidcombe', 'Campbelltown']
  },
  'Sydneham' => {
    :name => 'Sydneham',
    :connections => ['Campbelltown', 'Bankstown','Central']
  },
  'Central' => {
    :name => 'Central',
      :connections => ['Chatswood', 'Strathfield', 'Sydneham']
  },
  'Brooklyn' => {
    :name => 'Brooklyn',
    :connections => ['Hornsby']
  },
  'Campbelltown' => {
    :name => 'Campbelltown',
    :connections => ['Liverpool','Sydneham']
  },
  'Lidcombe' => {
    :name => 'Lidcombe',
    :connections => ['Liverpool','Bankstown', 'Strathfield']
  },
  'Blacktown' => {
    :name => 'Blacktown',
    :connections => ['Liverpool', 'Penrith', 'Richmond']
  },
  'Richmond' => {
    :name => 'Richmond',
    :connections => ['Blacktown']
  },
  'Penrith' => {
    :name => 'Penrith',
    :connections => ['Blacktown']
  }
} # end of stations hash





  #start = 'Blacktown'
  queue = [start]   # array of stations to examine
  #destination = 'Brooklyn'

  list = []                # array of stations visited
  trip = []                # array of trip taken
  stupid = []
  childs_plus_parents = []

  while queue.length > 0
    station_to_examine = queue[0]                         # is this the destination?

# binding.pry
    children = @stations[station_to_examine][:connections] # if not, get it's children
    children = children - list                            # if children in list remove those

    # now we start getting quite inelegant.
    # make an aray  of each CHILD with the immediate PARENT stuffed in front.
    childs_plus_parents = children.map { |e| station_to_examine + "," + e }
    # then add this array to the existing list of all stations with their immediate parents.
    stupid = stupid + childs_plus_parents


    #binding.pry

    # briefly back to nice code.................
    queue = queue | children

    if list.include? station_to_examine
      queue.shift              # if station_to_examine exists already in list, ignore it
    else                       # and just move on to the next item in the queue.
      list << queue.shift      # if not, append it to list for future examination.
    end
    # ...........................................


    # puts "station to examine " + station_to_examine
    # puts "queue #{queue}"
    # puts "list #{list}"
    # puts "stupid #{stupid}"

    if station_to_examine == destination
      break                                               # if yes, break out of this loop
    end

  # binding.pry
  end

  # now we have to pick apart the unwieldyl array trip to find the path.
  # If there's not a better way to do this, then I'm a monkey's uncle

  trip.unshift(destination)

  puts "stupid: " + stupid.to_s
  puts "trip: " + trip.to_s
  # binding.pry


  while stupid.length > 0

  # it's the last element that contains the destination and it';s immediate parent xxxx

  i = 0
    while i < stupid.length
      child_parent_pair = stupid[i]
      cp_length = child_parent_pair.length
      cp_split_index = child_parent_pair.index(",")
      child = child_parent_pair.slice(cp_split_index + 1, cp_length)
      parent = child_parent_pair.slice(0, cp_split_index)


      if child == trip[0]
        trip.unshift(parent)
        stupid.pop(stupid.length - i - 1)
        break
      end

      i = i + 1

    # puts i
    # puts "child: " + child.to_s
    # puts "stupid: " + stupid.to_s
    # puts "trip: " + trip.to_s
    # binding.pry
    end

  if ((trip[0] == start) and (trip[trip.length - 1] == destination))
    break
  end


  end

return trip.to_s

end
