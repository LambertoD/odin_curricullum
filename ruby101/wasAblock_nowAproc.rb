require 'minitest/autorun'

class BlockProcTest < Minitest::Unit::TestCase
  def setup
    @test = Array.new
  end
  def test1
    @test = %w{apple bad_apple cherry durian}
    @test.each_even do |fruit|
      puts "Yum I love #{fruit} pies don't you?"
    end
  end
  def test2
    @test = (1..5).to_a
    @test.each_even {|oddball| puts oddball.to_s + " is NOT and even number"}
  end


end


class Array
  def each_even(&wasABlock_nowAProc)
    isEven = true
    self.each do |object|
      if isEven
        wasABlock_nowAProc.call object
      end
      isEven = !isEven
    end
  end
end