class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_discounted?, :price, :tax, :total, :image_url, :description, :how_many, :supplier
end
