puts 'Основы Руби. Часть 2. задание 6'
basket = Hash.new('пусто')

loop do
  puts 'введите  название продукта'
  product_name = gets.chomp

  break if product_name.casecmp('стоп').zero?

  puts 'введите через пробел цену и количество'

  price, count = gets.split(' ').map(&:to_f)
  basket[product_name] = { price: price, count: count }
end

totall = 0.0
puts 'содержимое корзины: '
puts 'товар | цена | количество | сумма '
basket.each do |product_name, invoice|
  summ = invoice[:price] * invoice[:count]
  totall += summ
  puts "#{product_name} | #{invoice[:price]} | #{invoice[:count]} | #{summ}"
end
puts "Итого сумма заказа: #{totall}"
