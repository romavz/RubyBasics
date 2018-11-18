puts 'Введите Ваше имя: '
name = gets.chomp.capitalize

puts 'Укажите свой примерный рост: '
growth = gets.to_i

weight = growth - 110

if weight < 0
  puts 'Ваш вес уже оптимальный'
else
  puts "#{name}, Ваш идеальный вес: #{weight}кг."
end
