require 'minitest/autorun'

class TestTitleizeString < Minitest::Unit::TestCase
  def test_read_default
    File.open("files/text2.txt").each {|line| puts line}
  end
  def test_read_with_delimiter
    File.open("files/text2.txt").each(',') { |line| puts line }
  end
  def test_read_each_byte
    File.open("files/text2.txt").each_byte { |byte| p byte }
  end
  def test_read_each_char
    File.open("files/text2.txt").each_char { |byte| p byte }
  end
  def test_read_using_gets
    File.open("files/text2.txt") do |f|
      2.times { puts f.gets }
    end
  end
  def test_read_using_gets_with_delimiter
    File.open("files/text2.txt") do |f|
      2.times { puts f.gets(',') }
    end
  end
  def test_read_using_getc
    File.open("files/text2.txt") do |f|
      2.times { puts f.getc }
    end
  end
  def test_read_entire_file_into_array_split_by_lines
    puts File.open("files/text2.txt").readlines.join('--')
    # or
  end
  def test_read_arbitrary_number_of_bytes
    File.open("files/text2.txt") do |f|
      puts f.read(6)
    end
  end
  def test_better_read_methods_without_worrying_about_closing_files
    array_of_lines = File.readlines("files/text2.txt")
    # or
    data = File.read("files/text2.txt")
  end
  def test_reading_with_file_position
    f = File.open("files/text2.txt")
    puts f.pos 
    puts f.gets
    puts f.pos

    # 0
    # Fred Bloggs,Manager,Male,22
    # 28
  end
  def test_reading_with_pointer
   f = File.open("files/text2.txt")
    f.pos = 8
    puts f.gets
    puts f.pos

    # ggs,Manager,Male,22
    # 28
    
  end
end