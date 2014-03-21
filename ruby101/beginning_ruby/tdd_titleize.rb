require 'minitest/autorun'

class TestTitleizeString < Minitest::Unit::TestCase
  def setup
    @tester = Titleizer.new
  end
  def test_titleize_1
    assert_equal "This Is A Test", @tester.titleize("This is a test")
    assert_equal "Another Test 1234", @tester.titleize("another test 1234")
    assert_equal "We're Testing Titleize", @tester.titleize("We're testing titleize")
  end
  def test_titleize_2
    assert_equal "This Is A Test", @tester.titleize2("This is a test")
    assert_equal "Another Test 1234", @tester.titleize2("another test 1234")
    assert_equal "We're Testing Titleize", @tester.titleize2("We're testing titleize")
  end
end
class Titleizer
  def titleize(str)
    new_str = str.split(' ').map { |word| word.capitalize }
    new_str.join(' ')
  end
  def titleize2(str)
    str.gsub(/(\A|\s)\w/) { |letter| letter.upcase }
  end
end


