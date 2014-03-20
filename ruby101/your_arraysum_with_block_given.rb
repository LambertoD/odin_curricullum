class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    sum = initial_value
    if block_given?
      @array.each do |num|
        sum += yield(num)
      end
    else
      sum = @array.inject(sum) {|sum,num| sum+=num }
    end
    sum
  end
end
