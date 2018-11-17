puts 'Основы Руби. Часть 2. Задача 4.'

# string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
# symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

alpabet = ('a'..'z').each_with_index.to_h
VOWELS = %w[a e i o u y]

result = alpabet.select { |letter, _index| VOWELS.include?(letter) }

result.each do |letter, index|
  puts "#{letter}: #{index}"
end
