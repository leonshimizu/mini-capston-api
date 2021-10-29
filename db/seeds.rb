20.times do    
  product = Product.new(name: Faker::Device.model_name, price: rand(1..100), supplier_id: rand(1..5))
  product.save

  user = User.new(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password", password_confirmation: "password", admin: false)
  user.save

  # image = Image.new()
  # image.save

  # order = Order.new()
  # order.save

  # supplier = Supplier.new()
  # supplier.save

  # category = Category.new()
  # category.save

  # cp = CategoryProduct.new()
  # cp.save
end