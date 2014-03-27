require 'webrick'
load 'bot.rb'

class BotServeLet < WEBrick::HTTPServlet::AbstractServlet
  @@html = %q{
    <html><body>
    <form method="get"
      <h1>Talk to a Bot</h1>
      %RESPONSE%
      <p>
        <b>You say:</b> <input type="text" name="line" size="40" />
        <input type="submit" />
      </p>
    </form>
    </body></html>
  }

  def do_GET(request, response)
    response.status = 200
    response.content_type = "text/html"

    if request.query['line'] && request.query['line'].length > 1
      bot_text = $bot.response_to(request.query['line'].chomp)
    else
      bot_text = $bot.greeting
    end
    bot_text = %Q{<p><b>I say:</b> #{bot_text}</p>}
    response.body = @@html.sub(/\%RESPONSE\%/, bot_text)
  end
end

server = WEBrick::HTTPServer.new( Port: 1234 )
$bot = Bot.new( name: "Fred", data_file: "fred.bot" )
server.mount "/", BotServeLet
trap("INT") { server.shutdown }
server.start