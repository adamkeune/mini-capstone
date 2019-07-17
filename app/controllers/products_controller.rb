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
    @suppliers = Supplier.all
    @product = Product.new({
      title: params["title"],
      author: params["author"],
      description: params["description"],
      isbn: params["isbn"],
      price: params["price"],
      supplier_id: params["supplier_id"],
    })

    if @product.save
      @image = Image.new({
        url: params["url"],
        product_id: @product.id,
      })
      @image.save
      redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      render "new.html.erb"
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.html.erb"
  end

  def edit
    @suppliers = Supplier.all
    @image = Image.find_by(product_id: params["id"])
    @product = Product.find_by(id: params["id"])
    render "edit.html.erb"
  end

  def update
    @suppliers = Supplier.all
    @product = Product.find_by(id: params["id"])
    @image = Image.find_by(product_id: params["id"])

    @product.title = params["title"]
    @product.author = params["author"]
    @product.description = params["description"]
    @product.isbn = params["isbn"]
    @product.price = params["price"]
    @product.supplier_id = params["supplier_id"]
    @image.url = params["url"]

    if @product.save
      @image.save
      redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      @image = Image.find_by(product_id: params["id"])
      @product = Product.find_by(id: params["id"])
      render "edit.html.erb"
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    redirect_to "/products"
  end
end
