class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    id = params[:id]
    product = Product.find_by(id: id)
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price]
    )
    product.save
    render json: product
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.save
    render json: product
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    message = "You have successfully deleted the product at id of #{:id}."
    render json: message.as_json
  end
end