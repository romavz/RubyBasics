require_relative 'instance_counter'
require_relative 'instance_validator'

class Station
  NAME_PATTERN = /^\p{Alnum}\p{Alnum}|[\.\-\ ]{,49}$/.freeze
  STATION_NAME_NOT_DEFINED = 'Название станции не задано'.freeze
  BAD_STATION_NAME_MESSAGE = 'Название станции не соответствует шаблону'.freeze

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

  def each_train
    trains.each { |train| yield(train) }
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
