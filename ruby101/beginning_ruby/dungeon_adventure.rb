require 'minitest/autorun'

class TestDungeonAdventur < Minitest::Unit::TestCase
  def setup
    @dungeon_game = Dungeon.new("Fred Bloggs")
  end
  def test_dungeon_game_creates_a_player
    assert_equal "Fred Bloggs", @dungeon_game.player.name
  end
end

class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
    
  end

  class Player
    attr_accessor :name, :location
    def initialize(player_name)
      @name = player_name
      
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
  end
end