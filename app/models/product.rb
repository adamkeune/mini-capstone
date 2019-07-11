class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: (10..500) }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  def images=(input)
    if @images == nil
      @images = []
      @images << input
    else
      @images << input
    end
  end

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
