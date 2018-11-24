puts "insert a day"
day = gets.to_i
puts "insert a month"
month = gets.to_i
puts "insert a year"
year = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap_year = year % 4 == 0 && year % 100 != 0 ||  year % 400 == 0 
months[2] = 29 if leap_year

date_number = months[0...month - 1].sum + day
puts "the date number is #{date_number}"
