require 'minitest/autorun'

class Test99Bottles < Minitest::Unit::TestCase
  def setup
    @bottles = Bottles.new
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
  def first_verse
    "99 bottles of beer on the wall, 99 bottles of beer \n Take one down, pass it around, 98 bottles of beer on the wall"
  end
  def verse(number)
    if number == 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer \n Take one down, pass it around, #{number-1} bottles of beer on the wall"    
    else
      "#{number} bottles of beer on the wall, #{number} bottles of beer \n Take one down, pass it around, #{number-1} bottles of beer on the wall"    
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