puts 'Основы Руби. Часть 2. задание 6'
cart = {}

loop do
  puts 'введите  название продукта'
  product_name = gets.chomp

  break if product_name.casecmp('стоп').zero?

  puts 'введите через пробел цену и количество'

  price, count = gets.split(' ').map(&:to_f)
  cart[product_name] = { price: price, count: count }
end

total = 0.0
puts 'содержимое корзины: '
puts 'товар | цена | количество | сумма '
cart.each do |product_name, invoice|
  sum = invoice[:price] * invoice[:count]
  total += sum
  puts "#{product_name} | #{invoice[:price]} | #{invoice[:count]} | #{sum}"
end
puts "Итого сумма заказа: #{total}"
