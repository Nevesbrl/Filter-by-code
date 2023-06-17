PRODUCT_MAX = 100
products = []

puts 'Product registration.'

print "\nNumber of products to register (max #{PRODUCT_MAX}): "
quantity_of_product = gets.to_i

while !(1..PRODUCT_MAX).include?(quantity_of_product)
  print "Invalid input. Please enter a number between 1 and #{PRODUCT_MAX}: "
  quantity_of_product = gets.to_i
end

quantity_of_product.times do |product|
  code = nil

  loop do
    print "Enter the product code #{product + 1}: "
    code = gets.to_i

    if code.zero?
      puts 'Code cannot be empty. Please enter a valid code.'
    elsif products.any? { |p| p[:code] == code }
      puts 'This code has already been entered. Please enter a different code.'
    else
      break
    end
  end

  quantity = nil

  loop do
    print "Enter the quantity of the product #{product + 1}: "
    quantity = gets.to_i

    if quantity.zero?
      puts 'Quantity cannot be empty. Please enter a valid quantity.'
    elsif quantity.negative?
      puts 'Quantity must be a positive number.'
    else
      break
    end
  end

  products << { code: code, quantity: quantity }
end

puts "\nProduct query"

loop do
  print "\nEnter the product code (or 0 to exit): "
  query_product = gets.chomp

  break if query_product == '0'

  if query_product.empty?
    puts 'Code cannot be empty. Please enter a valid code.'
    next
  end

  query_product = query_product.to_i

  product = products.find { |p| p[:code] == query_product }

  if product
    quantity_found = product[:quantity]
    puts "Quantity found: #{quantity_found}"
  else
    puts 'Product not found'
  end
end
