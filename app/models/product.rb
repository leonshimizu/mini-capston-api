class Product < ApplicationRecord
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
end
