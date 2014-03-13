def add(*numbers)
  numbers.inject(0) {|sum,item| sum += item }
end
def subtract(*numbers)
  numbers.inject(&:-)
end
def calculate(*value)
  numbers = []
  option = {}
  value.each do |item|
    numbers << item if item.is_a? Fixnum
    numbers << item if item.is_a? Array
    option = item if item.is_a? Hash
  end
  numbers.flatten
  answer = add(*numbers) if option.none?
  answer = add(*numbers) if option[:add]
  answer = subtract(*numbers) if option[:subtract]
  answer
end