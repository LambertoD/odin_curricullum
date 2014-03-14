def sort_string(string)
  words = string.split(' ')
  sorted = words.sort {|x,y| x.length <=> y.length }
  sorted.join(' ')
end