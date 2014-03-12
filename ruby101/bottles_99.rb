require 'minitest/autorun'
load 'english_number.rb'

class Test99Bottles < Minitest::Unit::TestCase
  def setup
    @bottles = Bottles.new(EnglishNumber.new)
    @test_verse = "99 bottles of beer on the wall, 99 bottles of beer \n Take one down, pass it around, 98 bottles of beer on the wall"
  end
  def test_1_verse
    assert_equal @test_verse, @bottles.first_verse
  end
  def test_dynamic_verse
    assert_equal @test_verse, @bottles.verse(99)
  end
  def test_loop
    @bottles.loop_verse(99)
    
  end
end

class Bottles
  attr_reader :english
  def initialize english_numberer
    @english = english_numberer
  end
  def first_verse
    "99 bottles of beer on the wall, 99 bottles of beer \n Take one down, pass it around, 98 bottles of beer on the wall"
  end
  def verse(number)
    if number == 1
      "#{@english.english_number(number).capitalize} bottle of beer on the wall, #{@english.english_number(number)} bottle of beer \n Take one down, pass it around, #{@english.english_number(number-1)} bottles of beer on the wall"    
    else
      "#{@english.english_number(number).capitalize} bottles of beer on the wall, #{@english.english_number(number)} bottles of beer \n Take one down, pass it around, #{@english.english_number(number-1)} bottles of beer on the wall"    
    end  
  end
  def loop_verse(count)
    while count > 0 
      lyric = verse(count)
      puts lyric
      count-=1;
    end
  end
end