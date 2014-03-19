require 'minitest/autorun'

class OrangeTreeTest < Minitest::Unit::TestCase
  def setup
    @tree = OrangeTree.new(1)
  end
  def test_initial_height 
    assert_equal 1, @tree.height
  end
  def test_one_year_passes
    assert_equal 2, @tree.one_year_passes
  end
  def test_age_5_years
    assert_equal 5, 5.times {@tree.one_year_passes}
  end
  def test_produce_fruit_after_5_years
    5.times {@tree.one_year_passes}
    assert_in_delta 30, @tree.produce_fruit
  end
  def test_produce_fruit_after_10_years
    10.times {@tree.one_year_passes}
    assert @tree.produce_fruit >= 50 
  end
  def test_tree_dies_at_30
    30.times {@tree.one_year_passes}
    assert @tree.die
  end
  def test_count_the_oranges
    15.times {@tree.one_year_passes}
    puts "The count of oranges is : #{@tree.fruit}"
  end
  def test_pick_fruit
    5.times {@tree.one_year_passes}
    27.times {@tree.pick_an_orange}
  end
end

class OrangeTree
  attr_accessor :height, :fruit, :die
  def initialize(height)
    @height = height
    @fruit = 0
    @die = false
  end

  def one_year_passes
    @die = true if @height >= 30
    produce_fruit
    @height += 1
  end
  def produce_fruit
    # puts "Sorry no fruit yet until tree is 5 years old.  Tree is only #{@height}." if @height <=4
    puts "all of last years fruit have fallen off... about #{@fruit.to_i} fruit." if @height > 5
    @fruit = @height * 0.5 * 10 if (@height >= 5)
    puts "This years crop has about #{@fruit} oranges. \n"
    @fruit
  end
  def pick_an_orange
    if @fruit > 0
      puts "Count of oranges is #{@fruit.to_i}. Picked one"
      puts "This is a very delicious orange."
      @fruit -= 1
    else
      puts "No more fruits left this year.  Try again next year"
    end
    fruit_remaining
  end
  def fruit_remaining
    puts "#{@fruit.to_i} oranges are left in the tree\n"
  end
end
