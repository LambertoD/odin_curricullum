def random_select(array, n)
  max = (array.length)
  count = 0
  new_array = [] 
    while count < n
      new_array << array[rand(max)]
      count += 1
    end
  new_array
end