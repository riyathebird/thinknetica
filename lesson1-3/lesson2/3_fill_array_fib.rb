fib = [0, 1]

while fib[-2] + fib[-1] < 100  
  fib << fib[-2] + fib[-1]
end

puts fib
