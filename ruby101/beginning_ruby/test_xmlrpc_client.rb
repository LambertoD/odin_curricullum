require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://127.0.0.1:1234/")
puts server.call("sample.sumAndDifference", 5, 3).inspect

# ok, results = server.call2("sample.sumAndDifference", 5, 3).inspect

# if ok
#   puts results.inspect
# else
#   puts results.faultCode
#   puts results.faultString
# end
