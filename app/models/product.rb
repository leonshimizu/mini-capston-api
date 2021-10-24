class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :image_url
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { in: 10..500}, allow_blank: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  def is_discounted?
    price < 10
    # if price < 10
    #   return true
    # else
    #   return false
    # end
  end

  def tax
    float = price.to_f
    added_tax = float * 0.09
    return added_tax.round(2)
  end

  def total
    float = price.to_f
    added_tax = float * 0.09
    price = added_tax + float
  end

  def how_many 
    count = Product.where(name: name).count
    return count
  end

  # def supplier # same as code on line 2
  #   if supplier_id
  #     return Supplier.find(supplier_id)
  #   else
  #     return nil
  #   end
  # end
end
