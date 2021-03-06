require 'rack'
require './config/routes.rb'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  ROUTER.run(req, res)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
