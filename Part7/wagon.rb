require_relative 'vendor'
require_relative 'instance_validator'

class Wagon

  WAGON_NUMBER_PATTERN = /\d{1,5}/
  BAD_WAGON_NUMBER = 'Номер вагона задан неверно: '
  WAGON_NUMBER_NOT_DEFINED = 'Номер вагона не задан'

  ALL_SPACE_TAKEN_MESSAGE = 'В вагоне нет свободного места'
  NOT_ENOUGH_SPACE_MESSAGE = 'В вагоне недостаточно места'
  INVALID_CAPACITY_MESSAGE = 'Задано недопустимое значение  вместимости: '

  include Vendor
  include InstanceValidator

  attr_reader :number
  attr_reader :capacity
  attr_reader :properties
  attr_reader :taken_space

  def initialize(number, capacity = 0)
    @number = number
    @capacity = capacity.to_i
    @properties = {
      number: "номер вагона: #{number}",
      capacity: "емкость: #{capacity}",
    }
    @taken_space = 0
    validate!
  end

  def take_a_space(volume)
    raise StandardError, all_space_taken_message if free_space == 0
    raise StandardError, not_enough_space_message + "#{free_space}" if free_space - volume < 0
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
    1 #перегрузить в наследниках
  end

  def validate!
    raise ArgumentError, WAGON_NUMBER_NOT_DEFINED if number.nil?
    raise ArgumentError, BAD_WAGON_NUMBER + "#{number}" if number !~ WAGON_NUMBER_PATTERN
    raise ArgumentError, invalid_capacity_message + "#{capacity}" if invalid_capacity?
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
    !(capacity.between?(1, max_capacity))
  end

end
