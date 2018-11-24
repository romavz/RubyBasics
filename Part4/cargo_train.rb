require_relative 'train'

#  Грузовой поезд
class CargoTrain < Train

  protected

  def allowed_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end

end
