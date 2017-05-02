require 'rack'
require_relative "./Rubarb/router.rb"
require_relative "./controllers/users_controller.rb"
require_relative "./controllers/pies_controller.rb"

router = Router.new
router.draw do
  get Regexp.new("^/users/new$"), UsersController, :new
  post Regexp.new("^/users$"), UsersController, :create

  get Regexp.new("^/pies$"), PiesController, :index
  get Regexp.new("^/pies/new$"), PiesController, :new
  post Regexp.new("^/pies$"), PiesController, :create
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
