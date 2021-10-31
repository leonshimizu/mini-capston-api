class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def index
    carted_products = CartedProduct.where(status: "carted")
    render json: carted_products.as_json
  end

  def destroy # updating status to 'removed' 
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(
      status: "removed"
    )
    render json: {message: "Successfully removed from cart"}
  end
end