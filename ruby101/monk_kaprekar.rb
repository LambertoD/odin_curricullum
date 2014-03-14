def kaprekar?(k)
  num = (k*k).to_s
  z = num.length - 1
  for i in 0..z
     k == num[0..i].to_i + num[i+1..z].to_i  
  end
end
