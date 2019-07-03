class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("title ILIKE ? OR author ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      @products = @products.order(id: :asc)
    elsif params[:discount]
      @products = @products.where("price <= ?", 10)
      @products = @products.order(price: :asc)
    elsif params[:sort] == "price"
      if params[:sort_order] == "desc"
        @products = @products.order(price: :desc)
      else
        @products = @products.order(price: :asc)
      end
    else
      @products = @products.order(id: :asc)
    end

    render "index.json.jb"
  end

  def create
    @product = Product.new({
      id: params["id"],
      title: params["title"],
      author: params["author"],
      isbn: params["isbn"],
      image_url: params["image_url"],
      description: params["description"],
      price: params["price"],
    })

    if @product.save
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
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.price = params["price"] || @product.price

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
