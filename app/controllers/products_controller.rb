class ProductsController < ApplicationController
  def first_product
    render json: {message: "Hello"}
  end
end
