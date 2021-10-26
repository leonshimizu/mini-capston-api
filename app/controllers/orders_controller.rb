class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])

    order = Order.new(
      user_id: current_user.id,
      product_id: product.id,
      quantity: params[:quantity],
      subtotal: product.price,
      tax: product.tax,
      total: product.total
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
    order.product_id = params[:product_id] || order.product_id
    order.quantity = params[:quantity] || order.quantity
    order.save
    render json: order
  end

  def index
    orders = current_user.orders 
    render json: orders
  end
end
