puts "Hi! What's your name?"
name = gets.chomp
puts "What's your current height in cm?"
height = gets.chomp
weight = height.to_i - 110
if weight < 0 
	puts "#{name}, your weight is already ideal"
else
	puts "#{name}, your ideal weight is", weight
end

