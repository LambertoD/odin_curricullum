require 'webrick'

class MyServLet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.status = 200
    response.content_type = "text/plain"
    response.body = "Hello, world! I'm a ruby servelet"
    response.body = "You are trying to load #{request.path}"
  end
end


server = WEBrick::HTTPServer.new( Port: 1234)
server.mount "/", MyServLet
trap("INT") { server.shutdown }

server.start 