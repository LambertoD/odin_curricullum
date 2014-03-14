def non_duplicated_values(values)
  no_dups = []
  prev = 0
  values.sort.select do |item|
    if prev != item
      no_dups << item
    else
      no_dups.pop
    end
    prev = item
  end
  no_dups
end