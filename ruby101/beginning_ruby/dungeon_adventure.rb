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

  Player = Struct.new(:name, :location)
  Room = Struct.new(:reference, :name, :description, :connections)
end