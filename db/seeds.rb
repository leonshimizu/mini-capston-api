100.times do    
  product = Product.new(name: Faker::Device.model_name, price: rand(1..100))
  product.save
end