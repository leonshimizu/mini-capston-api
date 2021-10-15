class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    id = params[:id]
    product = Product.find_by(id: id)
    render json: product.as_json
  end

  def create
    new_product = Product.new(name: Faker::Dessert.variety, price: Faker::Number.decimal(l_digits: 2, r_digits: 2))
    render json: new_product.as_json
  end
end