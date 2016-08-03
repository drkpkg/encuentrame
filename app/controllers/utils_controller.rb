class UtilsController < ApplicationController
  def countries
    render json: CS.countries
  end

  def cities
    render json: CS.cities(params[:state], params[:country])
  end

  def states
    render json: CS.states(params[:country])
  end
end
