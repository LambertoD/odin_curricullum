require 'minitest/autorun'

class StaticArrayTest < Minitest::Unit::TestCase
  def setup
    @stack = Stack.new(10)
  end
  def test_push_to_stack
    assert_equal @stack, @stack.push(4)
  end
  def test_pop_stack
    @stack.push(10)
    assert_equal 10, @stack.pop
  end
  def test_empty
    refute  @stack.pop, "empty stack"
  end
  def test_full
    (1..15).to_a.each {|item| @stack.push(item) }
  end

end

class Stack
  def initialize(size)
    @max_size = size
    @my_stack = Array.new(size)
    @pointer = 0
  end
  def push(element)
    return nil if full?

    @my_stack[@pointer] = element 
    @pointer += 1
    self
  end
  def pop
    return nil if empty?
    pop_value = @my_stack[@pointer]
    @my_stack[@pointer] = nil
    pop_value
  end

  private
    def full?
      if @pointer >= @max_size
        puts "stack is full... cannot push"
        true
      else
        puts "stack is not full #{@pointer} #{@max_size}"
        false
      end
    end
    def empty?
      if @my_stack[0].nil?
        puts "stack is empty... cannot pop"
        true
      else
        false
      end 
    end

end
