class Menu < MenuItem
  ITEM_ID_OUT_OF_RANGE = 'Выбранный идентификатор меню не найден: '


  def initialize(title, command)
    super(title, command)
    @menu_items = {}
  end

  def add(id, menu_item)
    return unless menu_item.is_a?(MenuItem)

    @menu_items[id] = menu_item
  end

  def [](item_id)
    @menu_items.fetch(item_id)
  rescue KeyError
    raise KeyError, ITEM_ID_OUT_OF_RANGE + "#{item_id}"
  end

  def activate
    puts @title.to_s
    super
    @menu_items.each do |id, menu_item|
      title = menu_item.title
      # title = '/..' if id == '0' && title != 'Выход'
      puts "#{id}: #{title}"
    end
  end
end
