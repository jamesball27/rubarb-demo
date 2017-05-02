require_relative '../Rubarb/controller_base.rb'
require_relative '../models/user.rb'

class UsersController < ControllerBase

  def new
    render :new
  end

  def create
    @user = User.new(params["user"]["username"], params["user"]["password"])

    if @user.save
      session[:session_token] = rand(1..10)
      redirect_to "/pies"
    else
      flash.now[:errors] = @user.errors
      render :new
    end
  end

end
