class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: (10..500) }

  def is_discounted?
    # if price < 10
    #   true
    # else
    #   false
    # end
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
