class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def create
    @product = Product.create({
      id: params["id"],
      title: params["title"],
      author: params["author"],
      isbn: params["isbn"],
      image_url: params["image_url"],
      description: params["description"],
      price: params["price"],
    })
    render "show.json.jb"
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
    @product.save
    render "show.json.jb"
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Product deleted!" }
  end
end
