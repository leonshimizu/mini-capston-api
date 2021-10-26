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
    render json: order.as_json
  end
end
