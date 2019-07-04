class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: (10..500) }

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def images
    Image.where(product_id: id)
    # @images.map { |i|  }
  end

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
