require_relative 'command'

class CreateTrainCommand < Command
  def execute
    print 'Введите номер поезда: '
    number = gets.chomp
    print 'Введите название поезда: '
    name = gets.chomp

    train = create_train(number, name)
    application.trains << train unless train.nil?
  end

  protected

  # метод создания конкретного типа поезда должен быть перегружен в наследниках
  def create_train(number, name); end
end
