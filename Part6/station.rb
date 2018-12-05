require_relative 'instance_counter'

class Station
  attr_reader :name, :trains
  @@stations = []

  include InstanceCounter

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

  protected

  def validate!
    raise ArgumentError, 'Название маршрута не задано' if name.nil?
    message = 'Название маршрута должно быть от 1 до 50 символов, может содержать буквы, цифры, тире, пробелы, точки'
    raise ArgumentError, message if name !~ /^([а-яА-Я]|\d)([а-яА-Я\.\-\ ]|\d){,49}$/  
  end
end
