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
    self.speed += speed
  end

  def speed_down(speed)
    speed = self.speed - speed
    self.speed = if speed > 0
                   speed
                 else
                   0
                 end
  end

  def stopped?
    speed == 0
  end

  def route=(route)
    @route = route
    @current_station_index = 0
    current_station.arrive_train(self)
  end

  def get_next_station_index
    next_index = @current_station_index
    next_index += 1 if next_index < route.stations_count - 1
    next_index
  end
  private :get_next_station_index

  def get_prev_station_index
    prev_index = @current_station_index
    prev_index -= 1 if prev_index > 0
    prev_index
  end
  private :get_prev_station_index

  def go_to_next_station
    go_to_station(get_next_station_index)
  end

  def go_to_prev_station
    go_to_station(get_prev_station_index)
  end

  def next_station
    next_index = get_next_station_index
    @route.stations[next_index] if next_index != @current_station_index
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    prev_index = get_prev_station_index
    @route.stations[prev_index] if prev_index != @current_station_index
  end

  def go_to_station(station_index)
    if station_index != @current_station_index && !station_index.nil?
      current_station.depart_train(self)
      @current_station_index = station_index
      current_station.arrive_train(self)
    end
  end
end
