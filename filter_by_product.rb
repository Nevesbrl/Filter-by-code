PRODUCT_MAX = 100
products = []

puts 'Product registration.'

print "\nNumber of products to register (max #{PRODUCT_MAX}): "
quantityOfProduct = nil

loop do
  quantityOfProduct = gets.chomp.to_i
  break if quantityOfProduct.between?(1, PRODUCT_MAX)
  print "Invalid input. Please enter a number between 1 and #{PRODUCT_MAX}: "
end

quantityOfProduct.times do |product|
  code = nil

  loop do
    print "Enter the product code #{product + 1}: "
    code = gets.chomp.to_i

    break unless products.any? { |product| product[:code] == code }

    puts 'This code has already been entered. Please enter a different code.'
  end

  print "Enter the quantity of the product #{product + 1}: "
  quantity = gets.chomp.to_i

  products << {code: code, quantity: quantity}
end

puts "\nProduct query"

loop do
  print "\nEnter the product code (or 0 to exit): "
  queryProduct = gets.chomp.to_i

  break if queryProduct.zero?

  product = products.find { |exemple| exemple[:code] == queryProduct }

  if product
    quantityFound = product[:quantity]
    puts "Quantity found: #{quantityFound}"
  else
    puts 'Product not found'
  end
end
