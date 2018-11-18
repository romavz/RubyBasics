def get_side(side_number)
  puts "Введите размер #{side_number}й стороны"
  gets.to_f
end

puts 'Программа определения прямоугольного треугольника'

triangle = [get_side(1), get_side(2), get_side(3)]

triangle.sort!

side_1 = triangle[0]
side_2 = triangle[1]
hypotenuse = triangle[2]

side1_eq_side2 = side_1 == side_2
side1_eq_hypotenuse = side_1 == hypotenuse
triangle_has_equal_sides = side1_eq_side2 && side1_eq_hypotenuse

is_rectangular_triangle = side_1**2 + side_2**2 == hypotenuse**2
if is_rectangular_triangle && side1_eq_side2
  puts 'прямоугольный равнобедренный'
elsif is_rectangular_triangle
  puts 'прямоугольный'
elsif triangle_has_equal_sides
  puts 'равносторонний'
else
  puts 'не прямоугольный, не равносторонний'
end
