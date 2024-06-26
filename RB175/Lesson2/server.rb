require "socket"

server = TCPServer.new("localhost", 3003)

def parse_request(request_line)
  http_method, path_and_params, http = request_line.split
  path, params = path_and_params.split("?")
  params = (params || '').split("&").map { |param| param.split("=") }.to_h

  [http_method, path, params]
end

loop do
  client = server.accept
  client.puts "HTTP/1.1 200 OK\r/n/r/n"

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"
  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"
  # client.puts "<h1>Rolls!</h1>"

  # rolls = params["rolls"].to_i
  # sides = params["sides"].to_i
  
  # rolls.times do |roll|
  #   roll = rand(sides) + 1
  #   client.puts "<p>", roll, "</p>"
  # end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end
