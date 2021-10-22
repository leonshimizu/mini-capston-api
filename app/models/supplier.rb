class Supplier < ApplicationRecord
  def product
    Product.where(supplier_id: id)
  end
end
