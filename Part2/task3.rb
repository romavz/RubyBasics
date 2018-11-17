puts 'Основы Руби. Часть 2. Задача 3. Числа фибоначчи'

UP_LIMIT = 100

fibonacci = [0, 1]
next_number = 1
while next_number <= UP_LIMIT
  fibonacci << next_number
  next_number += fibonacci[-2]
end

puts
puts fibonacci.join(' ')
puts
