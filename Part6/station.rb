require_relative 'instance_counter'
require_relative 'instance_validator'

class Station
  attr_reader :name, :trains
  @@stations = []

  include InstanceCounter
  include InstanceValidator

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def arrive_train(train)
    @trains << train unless @trains.include?(train)
  end

  def get_trains_by_type(train_type)
    trains.select { |train| train.type == train_type }
  end

  def depart_train(train)
    trains.delete(train)
  end

  #=========================================
  protected
  #=========================================

  NAME_PATTERN = /^(\p{Alnum})(\p{Alnum}|[\.\-\ ]){,49}$/i

  def validate!
    raise ArgumentError, 'Название станции не задано' if name.nil?
    bad_station_name_message = 'Название станции должно быть от 1 до 50 символов, может содержать буквы, цифры, тире, пробелы, точки'
    raise ArgumentError, bad_station_name_message if name !~ NAME_PATTERN
  end
end
