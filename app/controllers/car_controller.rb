class CarController < ApplicationController

  def new_car
      if !params.has_key?(:make) || params[:make].strip.empty? || !params.has_key?(:year) || params[:year].strip.empty?
      render '/car/new_car'
    else
      @car1 = Car.new(params[:make], params[:year])
      session[:car] = @car1.to_yaml
      redirect_to '/simulator/create_car'
    end
  end
end
