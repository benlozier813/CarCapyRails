class SimulatorController < ApplicationController
  def create_car
    @car1 = YAML.load(session[:car])
  end

  def change_light
    @car1 = YAML.load(session[:car])
    @car1.light_switch
    session[:car] = @car1.to_yaml
    redirect_to '/simulator/create_car'
  end

  def change_speed
    @car1 = YAML.load(session[:car])
    @car1.change_speed
    session[:car] = @car1.to_yaml
    redirect_to '/simulator/create_car'
  end

  def brake
    @car1 = YAML.load(session[:car])
    @car1.brake
    session[:car] = @car1.to_yaml
    redirect_to '/simulator/create_car'
  end

  def parking_brake_toggle
  @car1 = YAML.load(session[:car])
  @car1.parking_brake(params[:parking_brake])
  session[:car] = @car1.to_yaml
  redirect_to '/simulator/create_car'
end

end
