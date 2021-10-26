class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: 1,
      product_id: 1,
      quantity: 1,
      subtotal: Product.find(1).price,
      tax: Product.find(1).tax,
      total: Product.find(1).total
    )
    render json: order.as_json
  end
end
