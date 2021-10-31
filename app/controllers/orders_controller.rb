class OrdersController < ApplicationController
  before_action :authenticate_user # same code as if current_user

  def create
    carted_products = CartedProduct.where(user_id: current_user.id)

    calculated_subtotal = 0
    calculated_tax = 0
    carted_products.each do |item|
      calculated_subtotal += item.product.price * item.quantity
      calculated_tax += item.product.tax * item.quantity
    end

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_subtotal + calculated_tax 
    )
    order.save

    carted_products.each do |item|
      item.update(
        status: "purchased",
        order_id: order.id
      )
    end
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
