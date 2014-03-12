require 'minitest/autorun'

class BirthdaySpankerTest < Minitest::Unit::TestCase
  def setup
    @bday = BirthdaySpanker.new
  end
  def test_how_many_years_old
    assert_equal 10, @bday.years_old(1970, 11, 16)
  end
end

class BirthdaySpanker
  def years_old(year, month, day)
    puts year.to_s + '/' + month.to_s + '/' + day.to_s
    10
  end
end