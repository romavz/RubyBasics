puts 'Основы Руби. Часть 2. Задача 4.'

VOWELS = %w[a e i o u y].freeze

vowels_hash = {}
('a'..'z').each_with_index do |letter, index|
  vowels_hash[letter] = index + 1 if VOWELS.include?(letter)
end

puts vowels_hash
