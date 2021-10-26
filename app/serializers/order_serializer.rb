class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id, :quantity, :subtotal, :tax, :total
  # belongs_to :user
  # belongs_to :product
end
