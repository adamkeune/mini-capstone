class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:id)
    render "index.html.erb"
  end

  def new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @product = Product.new({
      title: params["title"],
      author: params["author"],
      description: params["description"],
      isbn: params["isbn"],
      price: params["price"],
      supplier_id: params["supplier_id"],
    })

    @product.save

    @image = Image.new({
      url: params["url"],
      product_id: @product.id,
    })

    @image.save

    redirect_to "/products/#{@product.id}"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.html.erb"
  end
end
