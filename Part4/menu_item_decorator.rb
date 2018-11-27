
require_relative 'menu_item'

class MenuDecorator < Menu

  def activate
    command.execute
    menu.activate if menu != nil
  end

  def set_menu(menu)
    self.menu = menu
  end

  protected

  attr_accessor :menu

end
