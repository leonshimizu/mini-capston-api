class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      products = category.products
      render json: products
    else
      products = Product.all
      render json: products
    end
  end

  def show
    id = params[:id]
    product = Product.find_by(id: id)
    render json: product
  end

  def create
    product = Product.new(
      name: params[:name], 
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )

    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.supplier_id = params[:supplier_id] || product.supplier_id
    if product.save
      render json: product
    else
      render json: {erros: product.errors.full_messages}
    end
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    message = "You have successfully deleted the product at id of #{:id}."
    render json: message.as_json
  end
end