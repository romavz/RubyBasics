require_relative 'vendor'
require_relative 'instance_counter'
require_relative 'instance_validator'

class Train
  TRAIN_NUMBER_PATTERN = /^\p{Alnum}{3}-?\p{Alnum}{2}$/.freeze
  NAME_PATTERN = /^\p{Alnum}\p{Alnum}|[\.\-\ ]{,49}$/.freeze
  TRAIN_NUMBER_NOT_DEFINED = 'Номер поезда не задан'.freeze
  TRAIN_NAME_NOT_DEFINED = 'Название поезда не задано'.freeze
  BAD_TRAIN_NUMBER_MESSAGE = 'Задан недопустимый номер поезда: '.freeze
  BAD_TRAIN_NAME_MESSAGE = 'Задано недопустипое название поезда: '.freeze

  include Vendor
  include InstanceCounter
  include InstanceValidator

  attr_reader :speed
  attr_reader :number
  attr_reader :route
  attr_reader :name
  attr_reader :wagons
  @@trains = {}

  def initialize(number, name)
    @number = number
    @name = name
    @speed = 0
    @current_station_index = nil
    @wagons = []
    validate!

    @@trains[number] = self
    register_instance
  end

  def each_wagon
    wagons.each { |wagon| yield(wagon) }
  end

  def self.find(number)
    @@trains[number] || "Поезд с номером /'#{number}/' не найден"
  end

  def add_wagon(wagon)
    wagons << wagon if stopped? && allowed_wagon?(wagon)
  end

  def unhook_wagon(index)
    wagons.delete(index) if stopped?
  end

  def speed_up(speed)
    speed_down(speed) if speed < 0
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
    speed.zero?
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

  def wagon_number_is_valid?(number)
    wagons.index { |wagon| wagon.number == number }.nil?
  end

  # тип поезда
  def type; end

  #=========================================
  protected

  #=========================================

  def validate!
    raise ArgumentError, TRAIN_NAME_NOT_DEFINED if name.nil?
    raise ArgumentError, TRAIN_NUMBER_NOT_DEFINED if number.nil?
    raise ArgumentError, BAD_TRAIN_NUMBER_MESSAGE + number.to_s if number !~ TRAIN_NUMBER_PATTERN
    raise ArgumentError, BAD_TRAIN_NAME_MESSAGE + name.to_s if name !~ NAME_PATTERN
  end

  # наследники должны переопределить этот метод для разрешения вагонов,
  # соответствующих типу поезда
  def allowed_wagon?(wagon)
    wagon_number_is_valid?(wagon.number)
  end
end
