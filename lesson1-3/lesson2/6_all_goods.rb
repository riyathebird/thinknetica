purchase = {}
loop do
  puts 'Enter the product name: (or enter "stop", if finished)'
  product = gets.chomp
  break if product == "stop"
  puts 'Enter the price:'
  price = gets.to_f
  puts 'Enter the quantity:'
  quantity = gets.to_f
  price_list = { price: price, quantity: quantity } 
  purchase[product] = price_list
end
 # перевела на английский и заработал break в цикле а на русском break не работает. почему?

all_goods = 0
purchase.each do |product, price_list| 
  puts "Product: #{product},  Price: #{price_list}" # как можно вывести чтобы второй хэш вывелся
 # не как хэш, а как тоже нормально key = value ?
  puts sum = price_list[:price] * price_list[:quantity]
  all_goods += sum
end
puts "Total price is #{all_goods}" 
