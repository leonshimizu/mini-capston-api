class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products # same as code on line 5

  # def products
  #   products = []
  #   i = 0
  #   category_products.length.times do
  #     product = Product.find(category_products[i].product_id)
  #     products << product
  #     i += 1
  #   end
  #   return products
  # end
end
