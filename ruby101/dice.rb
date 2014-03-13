require 'minitest/autorun'

class DiceTest < Minitest::Unit::TestCase
  def setup
    @die = Dice.new
  end
  def test_roll
    assert_match /[1-6]/ ,@die.showing.to_s
  end
  def test_roll_7
    assert_equal 7, @die.cheat
  end
end

class Dice
  attr_accessor :number_showing
  def initialize
    roll
  end
  def showing
    @number_showing
  end
  def roll
    @number_showing = 1 + rand(6)
  end
  def cheat
    @number_showing = 7
  end
end
