require_relative 'instance_counter'
require_relative 'extentions/validation'

class Route
  NAME_PATTERN = /^\p{Alnum}\p{Alnum}|[\.\-\ ]{,49}$/.freeze
  ROUTE_NAME_NOT_DEFINED = 'Название маршрута не определено'.freeze
  BAD_ROUTE_NAME_MESSAGE = 'Название маршрута должно быть не более 50 символов и состоять из одного и более слов'.freeze
  DOUBLE_STATIONS_MESSAGE = 'Начальная и конечная станция должны быть разными'.freeze
  FIRST_STATION_NIL_MESSAGE = 'Начальная станция не задана'.freeze
  LAST_STATION_NIL_MESSAGE = 'Конечная станция не задана'.freeze

  include InstanceCounter
  include Validation

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
    return if [first_station, last_station].include?(station)

    @stations.delete(station)
  end

  def stations_count
    @stations.count
  end

  #=========================================
  protected

  #=========================================

  validate :name, :presence
  validate :name, :format, NAME_PATTERN
  validate :first_station, :presence
  validate :first_station, :type, Station
  validate :last_station, :presence
  validate :last_station, :type, Station

  def validate!
    super
    raise ArgumentError, DOUBLE_STATIONS_MESSAGE if first_station == last_station
  end
end
