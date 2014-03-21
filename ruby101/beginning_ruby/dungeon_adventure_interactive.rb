require 'minitest/autorun'

class TestDungeonAdventur < Minitest::Unit::TestCase
  def setup
    @my_dungeon = Dungeon.new("Labyrinth")
    @my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {west: :smallcave})
    @my_dungeon.add_room(:smallcave, "Small Cave", "a small claustrophobic cave", {east: :largecave})
    @my_dungeon.start(:largecave)
  end
  def test_loop
    puts "Hi #{@my_dungeon.player.name}.  Welcome to the Dungeon"
    @my_dungeon.show_current_location
    answer = ''
    puts "Where do you wish to go? (north, south, east or west)...  Exit to end game"
    answer = gets.chomp
    while answer.downcase != "exit"
      @my_dungeon.go(answer.to_sym)
      puts "Where do you wish to go? (north, south, east or west)...  Exit to end game"
      answer = gets.chomp
    end
  end
end

class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
  def start(location)
    @player.location = location
    # show_current_location
  end
  def show_current_location
    puts find_room_in_dungeon(@player.location).full_description
  end
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference}
  end
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end
  def go(direction)
    puts "You go " + direction.to_s
    location = find_room_in_direction(direction)
    if location.nil? 
      puts "that entry is blocked"
    else
      @player.location = location
    end 
    show_current_location
  end
  
  # Player = Struct.new(:name, :location)
  # Room = Struct.new(:reference, :name, :description, :connections)

  class Player
    attr_accessor :name, :location
    def initialize(name)
      @name = name
    end
      
  end
  class Room
    attr_accessor :reference, :name, :description, :connections
    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
      end
    def full_description
      "You are in " + @description + "\n.  You can move to #{connections.keys} to reach #{connections.values}"
    end
  end
end