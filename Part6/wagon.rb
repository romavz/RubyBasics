require_relative 'vendor'
require_relative 'instance_validator'

class Wagon

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
    message = "Номер вагона задан не верно: #{number}"
    raise ArgumentError, message if number !~ /\d{1,5}/
  end

end
