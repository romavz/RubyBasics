require_relative 'vendor'

class Wagon

  include Vendor

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

  def valid?
    validate!
    true
    rescue ArgumentError => ex
      false
  end

end
