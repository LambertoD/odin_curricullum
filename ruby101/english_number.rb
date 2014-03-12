
require 'minitest/autorun'

class TestEntries < Minitest::Unit::TestCase
  def setup
    @english_numberer = EnglishNumber.new
    # @number = 0
    # while (true)
    #   puts "Please enter a number between 1 and 999"
    #   @number = gets.chomp.to_i
    #   unless @number < 1 && @number > 999
    #     break
    #   end
    # end
    # puts @english_numberer.english_number @number
  end
  def test_say_111
    assert_match /one hundred eleven/, @english_numberer.english_number(111)
  end
  def test_say_923
    assert_match /nine hundred twenty-three/, @english_numberer.english_number(923)    
  end
  def test_say_1111
    assert_match /one thousand one hundred eleven/, @english_numberer.english_number(1111)
  end
  def test_say_9999
    puts @english_numberer.english_number(111111111)
  end
end

class EnglishNumber

  def english_number number
    num_string = ""
    ones_place = %w{one two three four five six seven eight nine }
    tens_place = %w{ten twenty thirty forty fifty sixty seventy eighty ninety}
    teenagers = %w{eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}

    left = number
    write = left / 1000000
    left = left - write * 1000000

    if write > 0
      millions = english_number write
      num_string += millions + ' million'
      if left > 0
        num_string += ' '
      end
    end

    write = left / 1000
    left = left - write*1000

    if write > 0
      thousands = english_number write
      num_string = num_string + thousands + ' thousand'
      if left > 0
        num_string = num_string + ' '
      end
    end

    write = left / 100       # get the hundreds to write out
    left = left - write*100  # subtract the hundreds and this is number left

    if write > 0
      hundreds = english_number write
      num_string = num_string + hundreds + ' hundred'
      if left > 0
        num_string = num_string + ' '
      end
    end

    write = left /10
    left = left - write*10

    if write > 0
      if (write == 1 and left > 0)
        num_string = num_string + teenagers[left - 1]
        left = 0
      else
        num_string = num_string + tens_place[write - 1]
      end
      if left > 0
       num_string = num_string + '-'
      end
    end

    write = left
    left = 0

    if write > 0
      num_string = num_string + ones_place[write - 1]
    end

    num_string
  end
end