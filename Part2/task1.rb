puts 'Месяцы по 30 дней'

months = {
  jan: 31,
  feb: 28,
  mar: 31,
  apr: 30,
  may: 31,
  jun: 30,
  jul: 31,
  aug: 31,
  sep: 30,
  oct: 31,
  nov: 30,
  dec: 31
}

months.each do |month, days_count|
  puts "#{month}: #{days_count}" if days_count == 30
end
