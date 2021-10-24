class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_discounted?, :price, :tax, :total, :description, :how_many
  belongs_to :supplier
  belongs_to :image_url
end
