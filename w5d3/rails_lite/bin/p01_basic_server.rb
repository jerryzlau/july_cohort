require 'rack'

Rack::Server.start(
  app: Proc.new do |env|
    ['200', {'Content-Type' => 'text/html'}, ['hello world']]
  end
)
