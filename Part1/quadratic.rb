puts 'Вычисление квадратного уровнения'

puts 'Введите через пробел коэфициенты: a b c'

a, b, c = gets.split(' ').map(&:to_f)

d = b**2 - 4.0 * a * c

if d < 0
  puts 'Корней нет'
  exit
end

root_of_d = Math.sqrt(d)

root1 = (-b + root_of_d) / (2.0 * a)

if d.zero?
  puts "Дискриминант = 0, корни х1, х2 = #{root1}"
  exit
end

root2 = (-b - root_of_d) / (2.0 * a)

puts "Дискриминант = #{d}, корни: х1 = #{root1}, x2 = #{root2}"
