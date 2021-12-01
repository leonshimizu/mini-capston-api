require 'rails_helper'

# RSpec.describe "Products", type: :request do
#   describe "GET /products" do
#     it "works! (now write some real specs)" do
#       get products_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

RSpec.describe "Products", type: :request do 
  describe "GET /products" do 
    it "should return all products in the db" do 
      supplier = Supplier.create!(
          name: "Tester",
          email: "test@gmail.com",
          phone_number: "0000000000"
        )
      product = Product.create!(
        name: "test 2",
        price: 0.00,
        description: "testing something else",
        supplier_id: supplier.id
      )
      get "/products"
      products = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(products.length).to eq(1)
    end
  end
end
