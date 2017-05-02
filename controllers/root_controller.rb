require_relative '../Rubarb/controller_base.rb'

class RootController < ControllerBase

  def root
    redirect_to "/users/new"
  end
end
