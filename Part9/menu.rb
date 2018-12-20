class Menu < MenuItem
  ITEM_ID_OUT_OF_RANGE = 'Выбранный идентификатор меню не найден: '.freeze

  def initialize(title, command)
    super(title, command)
    @menu_items = {}
  end

  def add(id, menu_item)
    return unless menu_item.is_a?(MenuItem)

    menu_items[id] = menu_item
  end

  def [](item_id)
    menu_items.fetch(item_id)
  rescue KeyError
    raise KeyError, ITEM_ID_OUT_OF_RANGE + item_id.to_s
  end

  def activate
    puts @title.to_s
    super
    show_menu
  end

  protected

  attr_reader :menu_items

  def show_menu
    menu_items.each do |id, menu_item|
      title = menu_item.title
      puts "#{id}: #{title}"
    end
  end
end
