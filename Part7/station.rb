require_relative 'instance_counter'
require_relative 'instance_validator'

class Station

  NAME_PATTERN = /^\p{Alnum}\p{Alnum}|[\.\-\ ]{,49}$/
  STATION_NAME_NOT_DEFINED = 'Название станции не задано'
  BAD_STATION_NAME_MESSAGE = 'Название станции должно быть от 1 до 50 символов, может содержать буквы, цифры, тире, пробелы, точки'

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

  def validate!
    raise ArgumentError, STATION_NAME_NOT_DEFINED if name.nil?
    raise ArgumentError, BAD_STATION_NAME_MESSAGE if name !~ NAME_PATTERN
  end
end
