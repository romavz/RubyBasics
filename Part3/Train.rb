module RubyBasicsPart3

  class Train

    attr_accessor :train_type
    attr_reader :wagon_count
    attr_reader :speed
    attr_accessor :current_station

    def initialize(number, train_type, wagon_count)
      @speed = 0
      @train_type = train_type
      @route = nil
    end

    def add_wagon
      @wagon_count += 1 if stopped
    end

    def unhook_wagon
      @wagon_count -= 1 if stopped
    end

    def speed_up
      speed += 1
    end

    def speed_down
      speed -= 1 if !stopped
    end

    def stopped
      speed == 0
    end

    def route=(route)
      @route = route
      go_to_station(self.route.first_station)
    end

    def route
      raise "Маршрут не задан" if @route == nil
      @route
    end

    def go_to_next_station
      station = next_station
      raise "Поезд находится на конечной станции маршрута" if station == nil
      go_to_station(station)
    end

    def go_to_prev_station
      station = previous_station
      raise "Поезд находится на начальной станции маршрута" if station == nil
      go_to_station(station)
    end

    def next_station
      route.get_station_after(current_station)
    end

    def previous_station
      route.get_station_before(current_station)
    end

    def go_to_station (station)
      raise "Не задана станция прибытия" if station == nil
      current_station.depart_train(self) if current_station != nil
      @current_station = station
      current_station.arrive_train(self)
    end

  end
end