require 'minitest/autorun'

class TestDungeonAdventur < Minitest::Unit::TestCase
  def setup
    @my_dungeon = Dungeon.new("Fred Bloggs")
  end
  def test_dungeon_game_creates_a_player
    assert_equal "Fred Bloggs", @my_dungeon.player.name
  end
  def test_add_a_room
    @my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {west: :smallcave})
    puts @my_dungeon.find_room_in_dungeon(:largecave).full_description
  end
  def test_start_player_initial_location
    @my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {west: :smallcave})
    @my_dungeon.add_room(:smallcave, "Small Cave", "a small claustrophobic cave", {east: :largecave})
    @my_dungeon.start(:smallcave)
  end
  def test_move_east_to_smallcave
    @my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", {west: :smallcave})
    @my_dungeon.add_room(:smallcave, "Small Cave", "a small claustrophobic cave", {east: :largecave})
    @my_dungeon.start(:largecave)
    @my_dungeon.go :west
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
    show_current_location
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
    @player.location = find_room_in_direction(direction)
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
      @name + "\n\nYou are in " + @description + ".  You can move to #{connections.keys} to reach #{connections.values}"
    end
  end
end