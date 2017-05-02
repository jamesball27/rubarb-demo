require_relative "../Rubarb/router.rb"
require_relative "../controllers/users_controller.rb"
require_relative "../controllers/pies_controller.rb"
require_relative "../controllers/root_controller.rb"

ROUTER = Router.new
ROUTER.draw do
  get Regexp.new("^/$"), RootController, :root

  get Regexp.new("^/users/new$"), UsersController, :new
  post Regexp.new("^/users$"), UsersController, :create

  get Regexp.new("^/pies$"), PiesController, :index
  get Regexp.new("^/pies/new$"), PiesController, :new
  post Regexp.new("^/pies$"), PiesController, :create
end
