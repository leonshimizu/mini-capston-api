class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_discounted?, :price, :tax, :total, :description, :how_many
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :carted_products
end
