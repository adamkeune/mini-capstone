class Order < ApplicationRecord
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :user

  # def subtotal
  #   # product.price * quantity
  # end

  # def tax
  #   # subtotal * 0.09
  # end

  # def total
  #   # subtotal + tax
  # end
end
