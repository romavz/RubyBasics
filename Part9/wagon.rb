require_relative 'vendor'
require_relative 'instance_validator'
require_relative 'extentions/validation'

class Wagon
  WAGON_NUMBER_PATTERN = /\d{1,5}/.freeze
  BAD_WAGON_NUMBER = 'Номер вагона задан неверно: '.freeze
  WAGON_NUMBER_NOT_DEFINED = 'Номер вагона не задан'.freeze

  ALL_SPACE_TAKEN_MESSAGE = 'В вагоне нет свободного места'.freeze
  NOT_ENOUGH_SPACE_MESSAGE = 'В вагоне недостаточно места'.freeze
  INVALID_CAPACITY_MESSAGE = 'Задано недопустимое значение  вместимости: '.freeze

  include Vendor
  include Validation

  attr_reader :number
  attr_reader :capacity
  attr_reader :taken_space

  def initialize(number, capacity = 0)
    @number = number
    @capacity = capacity.to_i
    @properties = {
      number: "номер вагона: #{number}",
      capacity: "емкость: #{capacity}"
    }
    @taken_space = 0
    validate!
  end

  def take_a_space(volume)
    raise all_space_taken_message if free_space.zero?
    raise not_enough_space_message + free_space.to_s if free_space - volume < 0

    @taken_space += volume
  end

  def free_space
    capacity - taken_space
  end

  def properties
    @properties[:ratio] = "свободно/занято: #{free_space}/#{taken_space}"
    @properties.values
  end
  #==========================

  protected

  #==========================
  def max_capacity
    1 # перегрузить в наследниках
  end

  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, WAGON_NUMBER_PATTERN

  def validate!
    super
    raise ArgumentError, invalid_capacity_message + capacity.to_s if invalid_capacity?
  end
  #==========================

  private

  #==========================
  def all_space_taken_message
    self.class::ALL_SPACE_TAKEN_MESSAGE
  end

  def invalid_capacity_message
    self.class::INVALID_CAPACITY_MESSAGE
  end

  def not_enough_space_message
    self.class::NOT_ENOUGH_SPACE_MESSAGE
  end

  def invalid_capacity?
    !capacity.between?(1, max_capacity)
  end
end
