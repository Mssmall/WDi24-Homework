require 'pry'


stations = {
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
    :connections => ['Sydneham', 'Cabramatta','Lidcombe']
  },
  'Cabramatta' => {
    :name => 'Cabramatta',
    :connections => ['Blacktown', 'Bankstown','Lidcombe', 'Glenfield']
  },
  'Sydneham' => {
    :name => 'Sydneham',
    :connections => ['Glenfield', 'Bankstown','Central']
  },
  'Central' => {
    :name => 'Central',
      :connections => ['Chatswood', 'Strathfield', 'Sydneham']
  },
  'Brooklyn' => {
    :name => 'Brooklyn',
    :connections => ['Hornsby']
  },
  'Glenfield' => {
    :name => 'Glenfield',
    :connections => ['Cabramatta','Sydneham']
  },
  'Lidcombe' => {
    :name => 'Lidcombe',
    :connections => ['Cabramatta','Bankstown', 'Strathfield']
  },
  'Blacktown' => {
    :name => 'Blacktown',
    :connections => ['Cabramatta']
  }
} # end of stations hash


# start with a staion, later we'll feed this in via argument.
start = 'Blacktown'
queue = [start]   # array of stations to examine
destination = 'Brooklyn'

list = []                # array of stations visited
trip = []                # array of trip taken
stupid = []
childs_plus_parents = []

while queue.length > 0
  station_to_examine = queue[0]                         # is this the destination?

  children = stations[station_to_examine][:connections] # if not, get it's children
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

puts trip

## then
# going backwards in the array stupid - find the next element that contains parent
# which will be a child in that instance.
# get it's index in the array stupid  - INDEX
# repeat the above

#binding.pry
