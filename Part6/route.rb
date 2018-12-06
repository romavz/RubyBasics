require_relative 'instance_counter'
require_relative 'instance_validator'

class Route

  include InstanceCounter
  include InstanceValidator

  attr_reader :stations
  attr_reader :name

  def initialize(name, first_station, last_station)
    @name = name
    @stations = [first_station, last_station]
    validate!
    register_instance
  end

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end

  # Добавляет станцию в конец списка перед конечной станцией
  def add_station(station)
    @stations.insert(-2, station)
  end

  # Добавляет станцию в список за указанной
  def add_station_after(prev_station, station)
    prev_index = @stations.index(prev_station + 1)
    @stations.insert(prev_index, station)
  end

  def remove_station(station)
    return if station == first_station || station == last_station

    @stations.delete(station)
  end

  def stations_count
    @stations.count
  end

  #=========================================
  protected
  #=========================================

  NAME_PATTERN = /^(\p{Alnum})(\p{Alnum}|[\.\-\ ]){,49}$/i

  def validate!
    bad_route_name_message = 'Название маршрута должно быть не более 50 символов и состоять из одного и более слов'
    raise ArgumentError, bad_route_name_message if name !~ NAME_PATTERN
    raise ArgumentError, 'Начальная станция не задана' if first_station.nil?
    raise ArgumentError, 'Конечная станция не задана' if last_station.nil?
    double_stations_message = 'Начальная и конечная станция должны быть разными'
    raise ArgumentError, double_stations_message if first_station == last_station
  end

end
