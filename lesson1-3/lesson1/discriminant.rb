puts "Enter the 'a' value"
a = gets.to_f
puts "Enter the 'b' value"
b = gets.to_f
puts "Enter the 'c' value"
c = gets.to_f
d = b**2 - 4 * a * c 
if d > 0
  sqrt_d = Math.sqrt(d)
  x1 = (- b + sqrt_d) / (2 * a)
  x2 = (- b - sqrt_d) / (2 * a)
  print "x1 = ", x1, ", x2 = ", x2
elsif d == 0
  x = (- b) / (2 * a)
  print "x = ", x
else 
  print "There are no roots of equation"
end
