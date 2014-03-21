require 'minitest/autorun'

class TestTitleizeString < Minitest::Unit::TestCase
  def test_write_default
    File.open("files/text3.txt", "w") do |f|
      f.puts "This is a test"
    end
  end
  def test_write_in_append_mode
    f = File.new("files/logfile.txt", "a")
    f.puts Time.now
    f.close
  end
  def _renaming_files
    File.rename("file1.txt", "file2.txt")
  end
  def _deleting_files
    File.delete("file1.txt")
    File.delete("file2.txt", "file3.txt", "file4.txt")
  end
end