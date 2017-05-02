require_relative '../Rubarb/controller_base.rb'
require_relative '../models/pie.rb'

class PiesController < ControllerBase

  def index
    @pies = Pie.all
  end

  def new
  end

  def create
    @pie = Pie.new(params["pie"]["flavor"], params["pie"]["price"])

    if @pie.save
      redirect_to "/pies"
    else
      flash.now[:errors] = @pie.errors
      render :new
    end
  end

end
