
class Menu < MenuItem

  def initialize(title, command)
    super(title, command)
    @menu_items = {}
  end

  def add(id, menu_item)
    return unless menu_item.is_a?(MenuItem)
    @menu_items[id] = menu_item
  end

  def activate
    puts @title.to_s
    super
    @menu_items.each do |id, menu_item|
      title = menu_item.title
      title = '/..' if id == "0" && title != 'Выход'
      puts "#{id}: #{menu_item.title}"
    end
  end
end
