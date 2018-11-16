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

months = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

months[2] = 29 if leap_year

counter = day
months.select { |i_month, _i_days| i_month < month }
      .each { |_i_month, i_days| counter += i_days }

puts counter
