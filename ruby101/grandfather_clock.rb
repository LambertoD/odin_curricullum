# Grandfather Clock. Write a method which takes a block and calls it once for each
# hour that has passed today. That way, if I were to pass in the block do puts
# 'DONG!' end, it would chime (sort of) like a grandfather clock. Test your method
# out with a few different blocks (including the one I just gave you). Hint: You
# can use Time.now.hour to get the current hour. However, this returns a number
# between 0 and 23, so you will have to alter those numbers in order to get
# ordinary clock-face numbers (1 to 12).
require 'minitest/autorun'

class GrandfatherClockTest < Minitest::Unit::TestCase
  def setup
    @clock = GrandfatherClock.new
  end
  def test_method_accepts_block
    assert @clock.give_me_a_block {puts "i sent a block to #{@clock} method "}
  end
  def test_method_no_block_given
    refute @clock.give_me_a_block
  end
  def test_hourly_chime
    assert_equal @clock.hourly_chime(13) { puts "DONG!"},@clock.hourly_chime(1) { puts "DONG!"}
    assert_equal @clock.hourly_chime(0) { puts "DONG!"},@clock.hourly_chime(12) { puts "DONG!"}
    assert_equal @clock.hourly_chime(6) { puts "DONG!"},@clock.hourly_chime(18) { puts "DONG!"}
  end

end


class GrandfatherClock
  def give_me_a_block
    if block_given?
      yield
      true
    else
      puts "no block given" 
    end
  end
  def hourly_chime hour
    hour -= 12 if hour > 12
    hour = 12  if hour == 0
    hour.times { yield }
  end
  def to_s
    "I am a grand father clock"
  end
end
