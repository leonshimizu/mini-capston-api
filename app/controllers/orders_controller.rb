class OrdersController < ApplicationController
  before_action :authenticate_user # same code as if current_user

  def create
    carted_products = CartedProduct.where(user_id: current_user.id)

    item_price = 0
    carted_products.each do |item|
      item_price += item.product.price
    end
    tax = item_price * 0.07
    total = item_price + tax
  
    order = Order.new(
      user_id: current_user.id,
      subtotal: item_price,
      tax: tax,
      total: total 
    )
    order.save
    render json: order
  end

  def show
    order = Order.find(params[:id])
    if order.user_id == current_user.id
      render json: order
    else
      render json: {message: "Sorry, no order found..."}
    end
  end

  def update
    order = Order.find(params[:id])
    if order.user_id == current_user.id
      order.product_id = params[:product_id] || order.product_id
      order.quantity = params[:quantity] || order.quantity
      order.save
      render json: order
    else
      render json: {message: "Sorry, no order found..."}
    end
  end

  def index
      orders = current_user.orders 
      render json: orders
  end
end
