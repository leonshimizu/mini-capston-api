class OrderSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :tax, :total
  belongs_to :user
  belongs_to :product
  has_many :carted_products
end
