class Product < ApplicationRecord
  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    float = price.to_f
    added_tax = float * 0.09
    price = added_tax + float
  end
end
