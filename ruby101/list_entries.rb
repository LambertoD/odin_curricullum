require 'minitest/autorun'

class TestEntries < Minitest::Unit::TestCase
  def setup
    @entries = Entries.new
    puts "Enter as many words as you want, one per line"
    puts "... when you are done press \"Enter\" on an empty line"
    word = ' '
    while (word != "\n")
      word = gets
      break if word == "\n"
      @entries.entry << word.chomp
    end
  end
  def test_entry_from_user
    puts "Here are your entries in alphabetical order:"
    puts @entries.alphabetize.join(', ').to_s.rjust 50
  end
end

class Entries
  attr_accessor :entry

  def initialize 
    @entry = []
  end
  def alphabetize
    @entry.sort
  end
end