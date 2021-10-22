class Supplier < ApplicationRecord
  has_many :products
  
  # def products # same as code on line 2
  #   Product.where(supplier_id: id)
  # end
end
