puts 'Введите цифрами число.месяц.год'

FEBRUARY = 1

day, month, year = gets.split('.').map(&:to_i)

leap_year = year % 400 == 0 || year % 4 == 0 && year % 100 != 0

days_count = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days_count[FEBRUARY] = 29 if leap_year

counter = days_count.take(month - 1).sum + day

puts counter
