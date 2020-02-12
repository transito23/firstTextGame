#
# Adventure_Game.rb, Realms.rb, Leon.rb
# Ivan Transito
#
require_relative "Realms"
require_relative "Leon"

player = Player.new(0, [])

zombie_land = Realm.new("Zombie Land", 5, "Axe")
reverse = Realm.new("Gas station", 8, "Gas tank") #Gas Station
amish = Realm.new("landcaster, PA 1760", 0, "2 x 4 wood")
space_station = Realm.new("Infinity Station", 10, "Infinity stone")
forest = Realm.new("Forest", 2, "Piece of paper")

zombie_land.east = reverse
reverse.west = zombie_land

reverse.south = amish
amish.north = reverse

amish.south = space_station
space_station.north = amish

reverse.east = forest
forest.west = reverse

current_realm = forest

puts "\e[H\e[2J"
puts
puts "It seems that you spawned in a random location?"
puts
print "It is completey dark, do you wish to light up a candle? "
selection = gets.chomp.downcase[0]
if selection == "y"
  puts "*You have lit up your candle"
  print "press ENTER to continue"
  trash_it = gets
elsif  selection == "n"
  puts "You have choosen not to see"
  puts "while being not being able to see clearly you have walked to a tree
  and bumped into a tree knocking you out."
  trash_it = gets.chomp.downcase[0]
  exit
else
  puts "Nothing happen."
  exit
end


puts "You see trees everywhere it seems like your are in a forest"
puts
puts "looks like theres a portal west in your direction"
puts

loop do
  puts "You have #{player.gold} gold"
  puts "Your Backpack: #{player.backpack}"
  puts "Items in realm : #{current_realm.item}"
  puts
  current_realm.dimensions
  puts
  print "what you would you like to do? "
  choice = gets.chomp.downcase[0]

  if choice == "q"
    puts "Bye bye."
    break
  elsif choice == "?" || choice == "h"
    puts
    puts "h or ?                   --> help"
    puts "quit                     --> quit game "
    puts "north|south|east|west    --> go north|south|east|west"
    puts "take gold                --> take the gold"
    puts "pick up item             --> take item"
    puts "drop gold                --> drop gold"
    puts
  elsif choice == "t"
    player.gold += current_realm.gold
    current_realm.gold = 0
  elsif choice == "p"
    current_realm.item = player.put_in_backpack(current_realm.item)
    current_realm.item = nil
  elsif choice == "d"
    current_realm.gold = player.gold
    player.gold = 0
  else
    new_realm = current_realm.get_dimension(choice)
    if new_realm == nil
      puts
      puts "You cannot go that way"
    else
      current_realm = new_realm
    end
  end

  print "Press ENTER to continue"
  junk = gets
  puts "\e[H\e[2J"

end
