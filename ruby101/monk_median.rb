def median(*list)
  # write your method here
  return nil if list.empty?
  a, *middle, b  = list.sort
  if middle.size == 1
    return middle.join.to_i
  end
  if middle.size.odd?
    median(middle)
  else
    mid = middle.size / 2
    return (middle[mid-1] + middle[mid]).to_f / 2
  end
end