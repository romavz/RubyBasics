puts "Основы Руби. Часть 2. Задача 3. Числа фибоначчи"

base_range = (3..100)

array = [0, 1, 2]

base_range.each do |range_item|
  item_is_fibonacchi_number = range_item == array[-1] + array[-2]
  if item_is_fibonacchi_number
    array << range_item
  end
end

array.each { |item| puts "#{item}" }