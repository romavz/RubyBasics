puts 'Введите цифрами число.месяц.год'

day, month, year = gets.split('.').map(&:to_i)

leap_year =
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end

days_count = %w[31 28 31 30 31 30 31 31 30 31 30 31].map(&:to_i)

february = 1
days_count[february] = 29 if leap_year

counter = days_count.take(month - 1).sum + day

puts counter
