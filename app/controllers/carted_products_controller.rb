class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status]
    )
    carted_product.save
    render json: carted_product.as_json
  end
end