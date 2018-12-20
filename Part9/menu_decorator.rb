require_relative 'menu'

class MenuDecorator < Menu
  attr_writer :target_menu

  def activate
    command.execute unless command.nil?
    @target_menu.activate unless @target_menu.nil?
  end

  def [](item_id)
    @target_menu[item_id]
  end
end
