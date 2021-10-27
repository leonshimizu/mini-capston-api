class OrdersController < ApplicationController
  def create
    if current_user
      product = Product.find(params[:product_id])

      order = Order.new(
        user_id: current_user.id,
        product_id: product.id,
        quantity: params[:quantity],
        subtotal: (product.price * params[:quantity]),
        tax: (product.tax * params[:quantity]),
        total: (product.total * params[:quantity])
      )
      order.save
      render json: order
    else
      render json: {message: "Sorry you must be logged in..."}
    end
  end

  def show
    if current_user
      order = Order.find(params[:id])
      if order.user_id == current_user.id
        render json: order
      else
        render json: {message: "Sorry, no order found..."}
      end
    else
      render json: {message: "Sorry you must be logged in..."}
    end
  end

  def update
    if current_user
      order = Order.find(params[:id])
      if order.user_id == current_user.id
        order.product_id = params[:product_id] || order.product_id
        order.quantity = params[:quantity] || order.quantity
        order.save
        render json: order
      else
        render json: {message: "Sorry, no order found..."}
      end
    else
      render json: {message: "Sorry you must be logged in..."}
    end
  end

  def index
    if current_user
      orders = current_user.orders 
      render json: orders
    else
      render json: {message: "Sorry you must be logged in..."}
    end
  end
end
