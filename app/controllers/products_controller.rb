class ProductsController < ApplicationController
  def first_product
    render json: {message: "Hello"}
  end

  def all_products
    products = Product.all
    render json: {all: products}
  end
end

# test