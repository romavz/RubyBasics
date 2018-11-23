
class Menu < MenuItem
  def initialize (title, command)
    super(title, command)
    @menu_items = {}
  end

  def add(id, menu_item)
    return unless menu_item.is_a?(MenuItem)
    @menu_items[id] = menu_item
  end

  def activate()
    puts "#{@title}"
    super
    @menu_items.each { |id, menu_item| puts "#{id}: #{menu_item.title}" }
  end
end
