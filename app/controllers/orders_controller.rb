class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: Product.find(params[:product_id]).price,
      tax: Product.find(params[:product_id]).tax,
      total: Product.find(params[:product_id]).total
    )
    order.save
    render json: order.as_json
  end
end
