PRODUCT_MAX = 100
products = []

puts 'Product registration.'

print "Number of products to register (max #{PRODUCT_MAX}): "
quantityOfProduct = gets.chomp.to_i

quantityOfProduct.times do |product|
  print "Enter the product code #{product + 1}: "
  code = gets.chomp.to_i

  print "Enter the quantity of the product #{product + 1}: "
  quantity = gets.chomp.to_i

  products << [code: code, quantity: quantity]
end
