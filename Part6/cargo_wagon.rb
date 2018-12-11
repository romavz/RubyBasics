require_relative 'wagon'

class CargoWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Грузоподъемность выходит за допустимые пределы 0..40000'
  ALL_VOLUME_TAKEN_MESSAGE = 'Вагон заполнен до предела'
  NOT_ENOUGH_SPACE_MESSAGE = 'Недостаточно свободного пространства: '

  attr_reader :load_capacity
  attr_reader :taken_volume

  def initialize(number, load_capacity)
    @load_capacity = load_capacity.to_f
    @properties << "грузоподъемность: #{load_capacity}"
    super(number)
  end

  def fill_volume(volume)
    raise StandardError, ALL_VOLUME_TAKEN_MESSAGE if free_volume == 0
    raise StandardError, NOT_ENOUGH_SPACE_MESSAGE + "#{free_volume}" if free_volume - volume < 0
    @taken_volume += volume
  end

  def free_volume
    load_capacity - taken_volume
  end

  def properties
    @properties.concat(["свободно/занято: #{free_volume}/#{taken_volume}"])
  end

  protected

  def validate!
    super
    raise ArgumentError, INVALID_CAPACITY_MESSAGE unless load_capacity.between?(0, 40000)
  end

end
