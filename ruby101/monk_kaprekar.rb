def kaprekar?(k)
  num = (k*k).to_s
  z = num.length - 1
  truthy = false
  for i in 0..z
    truthy = true if k == num[0..i].to_i + num[i+1..z].to_i  
  end
  truthy
end