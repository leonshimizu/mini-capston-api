Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/product1", controller: "products", action: "first_product"
  get "/all", controller: "products", action: "all_products"
end
