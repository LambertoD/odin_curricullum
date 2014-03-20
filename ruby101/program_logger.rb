# • Program Logger. Write a method called log, which takes a string description of
# • a block and, of course, a block. Similar to doSelfImportantly, it should puts
# • a string telling that it has started the block, and another string at the end
# • telling you that it has finished the block, and also telling you what the
# • block returned. Test your method by sending it a code block. Inside the block,
# • put another call to log, passing another block to it. (This is called
# • nesting.) In other words, your output should look something like this:

# Beginning "outer block"... Beginning "some little block"... ..."some little
# block" finished, returning:  5 Beginning "yet another block"... ..."yet another
# block" finished, returning:  I like Thai food! ..."outer block" finished,
# returning:  false

require 'minitest/autorun'

class ProgramLoggerTest < Minitest::Unit::TestCase
  def setup
    @logger = ProgramLogger.new
  end
  def test_state_block_started
    @logger.log("\"outer block\"") do |msg| 
      # puts "#{msg}"
      @logger.log("\"some little block\"") do |msg2|
        @logger.log("\"yet another block\"") { "i love thai food"} 
        "almost done"
      end
      "finally done"
    end
  end

end

class ProgramLogger
  def log(message, &a_block)
    puts "Beginning #{message}..."
    value_returned = a_block.call(message)
    puts "...#{message} finished, returning: "
    puts value_returned
  end

end
