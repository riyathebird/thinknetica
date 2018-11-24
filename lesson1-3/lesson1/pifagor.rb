puts "Enter the first triangle side 'a' value"
a = gets.to_f
puts "Enter the second triangle side 'b' value"
b = gets.to_f
puts "Enter the third triangle side 'c' value"
c = gets.to_f
if a > b && a > c 
  hypotenuse = a
  cat1 = b
  cat2 = c
elsif b > a && b > c 
  hypotenuse = b
  cat1 = a
  cat2 = c 
elsif c > a && c > b 
  hypotenuse = c
  cat1 = a
  cat2 = b 
elsif a == b && a == c
  hypotenuse = a
  cat1 = a
  cat2 = a 
  isosceles = true    
end

if hypotenuse**2 == cat1**2 + cat2**2
  pifagor = true
end  

if isosceles
  puts "The triangle is isosceles"
elsif cat1 == cat2 && pifagor
  puts "The triangle is square and equilateral"    
elsif pifagor
  puts "The triangle is square"
else
  puts "The triangle is not square"
end
