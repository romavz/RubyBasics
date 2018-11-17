puts 'Основы Руби. Часть 2. Задача 3. Числа фибоначчи'

UP_LIMIT = 100

base_range = (2..UP_LIMIT)

fibonacci = [0, 1]
next_number = 1
while next_number <= UP_LIMIT
  fibonacci << next_number
  next_number = next_number + fibonacci[-2]
end

puts
  puts fibonacci.join(" ")
puts
