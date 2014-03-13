require 'minitest/autorun'

class BirthdaySpankerTest < Minitest::Unit::TestCase
  def setup
    @bday = BirthdaySpanker.new
  end
  def test_how_many_years_old
    assert_equal 43, @bday.years_old(1970, 11, 16)
  end
  def test_bday_spanker
    puts 'SPANK! '*@bday.years_old(2001,9,24) 
  end
end

class BirthdaySpanker
  def years_old(year, month, day)
    bday = Time.mktime(year, month, day)
    today = Time.new
    one_year = 60 * 60 * 24 * 365
    years = today - bday
    years.to_i / one_year
  end
end