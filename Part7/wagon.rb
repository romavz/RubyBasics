require_relative 'vendor'
require_relative 'instance_validator'

class Wagon

  WAGON_NUMBER_PATTERN = /\d{1,5}/
  BAD_WAGON_NUMBER = 'Номер вагона задан неверно: '
  WAGON_NUMBER_NOT_DEFINED = 'Номер вагона не задан'

  include Vendor
  include InstanceValidator

  attr_reader :number
  attr_reader :properties

  def initialize(number)
    @number = number
    @properties = ["номер вагона: #{number}"]
    validate!
  end

  protected

  def validate!
    raise ArgumentError, WAGON_NUMBER_NOT_DEFINED if number.nil?
    raise ArgumentError, BAD_WAGON_NUMBER + "#{number}" if number !~ WAGON_NUMBER_PATTERN
  end

end
