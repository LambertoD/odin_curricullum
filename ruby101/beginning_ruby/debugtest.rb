# to invoke debugger 
#   ruby -r debug debugtest.rb
# use following commands while in debug mode
    # list : shows code being debugged
    # step : runs the next line
    # cont :  run the program without stepping
    # break : set a hard breakpoint in a particular line number
    # watch : set condition breakpoint  i.e  i > 10000
    # quit : to exit


i = 1
j = 0
until i > 1000000
  i *= 2
  j += 1
end
puts "i = #{i}, j = #{j}"
