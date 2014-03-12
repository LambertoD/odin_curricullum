require 'minitest/autorun'

class LeapYearTest < Minitest::Unit::TestCase
  def setup
    @leap_years = LeapYears.new
  end
  def test_default_leap_year
    assert @leap_years.is_leap_year(1984), "is_leap_year"
    assert @leap_years.is_leap_year(2000), "is_leap_year"
    assert @leap_years.is_leap_year(1600), "is_leap_year"
    assert @leap_years.is_leap_year(1999) == false, "is not leap year"
  end
  def test_leap_years_between_starting_and_ending_year
    puts "Enter starting year:"
    starting_year = gets.chomp
    start_y = starting_year.to_i
    puts "Enter ending year:"
    ending_year = gets.chomp
    end_y = ending_year.to_i
    puts "The leap years are: "
    while (end_y >= start_y)
      puts end_y if @leap_years.is_leap_year(end_y)
      end_y -= 1;
    end
    puts "\ndone"
  end
end

class LeapYears
  def is_leap_year(year)
    return true if year % 4 == 0
    return true if (year % 100 == 0 && year % 400 == 0)
    return false
  end

end