puts 'Основы Руби. Часть 2. Задача 3. Числа фибоначчи'

up_limit = 100

base_range = (2..up_limit)

array = [0, 1, 1]

base_range.each do |range_item|
  item_is_fibonacchi_number = range_item == array[-1] + array[-2]
  array << range_item if item_is_fibonacchi_number
end

array.each { |item| print item.to_s, ' ' }

# или как в киркоматыге Дэйва Томаса
array2 = [0]
i1 = 1
i2 = 1
while i1 <= up_limit
  array2 << i1
  i1, i2 = i2, i1 + i2
end

puts
array2.each { |item| print item, ' ' }
puts
