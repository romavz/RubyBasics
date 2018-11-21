class Train
  attr_reader :train_type
  attr_reader :wagon_count
  attr_reader :speed
  attr_accessor :number
  attr_reader :route

  CARGO = :cargo
  PASSENGER = :passenger

  def initialize(number, train_type, wagon_count)
    @number = number
    @train_type = train_type
    @wagon_count = wagon_count
    @speed = 0
    @route = nil
    @current_station_index = nil
  end

  def add_wagon
    @wagon_count += 1 if stopped?
  end

  def unhook_wagon
    @wagon_count -= 1 if stopped? && (@wagon_count > 0)
  end

  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    if @speed > speed
      @speed -= speed
    else
      @speed = 0
    end
  end

  def stopped?
    speed == 0
  end

  def route=(route)
    return unless route.is_a?(Route)
    @route = route
    @current_station_index = 0
    current_station.arrive_train(self)
  end

 def go_to_next_station
    return if next_station.nil?
    current_station.depart_train(self)
    next_station.arrive_train(self)
    @current_station_index += 1
  end

  def go_to_prev_station
    return if previous_station.nil?
    current_station.depart_train(self)
    previous_station.arrive_train(self)
    @current_station_index -= 1
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return unless @current_station_index.positive?
    @route.stations[@current_station_index - 1]
  end

  #-----------------------------------------
  #     Private section
  #-----------------------------------------
  private

  def get_next_station_index
    next_index = @current_station_index
    next_index += 1 if next_index < route.stations_count - 1
    next_index
  end

  def get_prev_station_index
    prev_index = @current_station_index
    prev_index -= 1 if prev_index > 0
    prev_index
  end

end
