require 'minitest/autorun'

class DeafGrandma < Minitest::Unit::TestCase
  def setup
    @grandma = Grandma.new
  end
  def test_default_reply
    assert_equal "HUH?! SPEAK UP, SONNY!", @grandma.default_reply
  end
  def test_talk_to_grandma
    @grandma.talk_to_grandma    
  end
  def test_random_year_returns_between_30_and_50
    assert @grandma.random_year => 30 && @grandma.random_year <= 50 
  end
end

class Grandma
  def default_reply
    "HUH?! SPEAK UP, SONNY!"
  end
  def talk_to_grandma
    puts "Here we go... let\'s talk to grandma \n Speak now..."
    exit_line, line = ''
    while exit_line != 'BYEBYEBYE'
      line = gets.chomp
      if line.downcase == 'bye'
        exit_line += line.upcase
        puts exit_line
      else
         exit_line = ''
      end
      break if exit_line == 'BYEBYEBYE'
      if line == line.upcase
        puts "NO, NOT SINCE 19#{random_year}"
      else
        puts default_reply
      end
    end
  end
  def random_year
    year = 0
    while (year < 30 || year > 50)
      year = rand(51)
    end
    year
  end
end