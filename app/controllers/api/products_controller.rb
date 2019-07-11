class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("title ILIKE ? OR author ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:discount]
      @products = @products.where("price <= ?", 10)
    end

    if params[:sort] == "price"
      if params[:sort_order] == "desc"
        @products = @products.order(price: :desc)
      else
        @products = @products.order(price: :asc)
      end
    else
      @products = @products.order(id: :asc)
    end

    if params["category"]
      @products = Category.find_by(name: params["category"]).products
    end

    render "index.json.jb"
  end

  def create
    @product = Product.new({
      id: params["id"],
      title: params["title"],
      author: params["author"],
      isbn: params["isbn"],
      description: params["description"],
      price: params["price"],
      supplier_id: params["supplier"],
    })

    if @product.save
      @product.images = Image.create(url: params["image_url"], product_id: @product.id)
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.title = params["title"] || @product.title
    @product.author = params["author"] || @product.author
    @product.images = Image.create(url: params["image_url"], product_id: @product.id) || @product.images
    @product.description = params["description"] || @product.description
    @product.price = params["price"] || @product.price
    @product.supplier_id = params["supplier"] || @product.supplier_id

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product deleted!" }
  end
end
