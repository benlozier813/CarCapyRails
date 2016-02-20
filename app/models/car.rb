class Car
  def initialize(make, year)
    @make = make
    @year = year
    @lights = false
    @speed = 0
    @parking_brake = "off"
  end

  def name_car
    @make + " " + @year
  end

  def light_value
    if @lights == false
      "The lights are off"
    else
      "The lights are on"
    end
  end

def check_speed
  "Speed: " + @speed.to_s
end

def change_speed
  if @parking_brake == "off"
  @speed += 10
else
  @speed = 0
end
end

def brake
  if @speed > 0
    @speed -= 6
  end
  if @speed < 0
    @speed = 0
  end
end

def parking_brake(value)
    @parking_brake = value
end

  def light_switch
    @lights = !@lights
  end
end
