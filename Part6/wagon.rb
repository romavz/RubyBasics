require_relative 'vendor'

class Wagon

  include Vendor

  attr_reader :number
  attr_reader :properties

  def initialize(number)
    @number = number
    @properties = ["номер вагона: #{number}"]
  end

end
