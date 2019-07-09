class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }

  def subtotal
    product.price * quantity
  end

  def tax
    subtotal * 0.09
  end

  def total
    subtotal + tax
  end
end
