class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted")
    # @carted_products = current_user.carted_products.where(status: "Carted") --> alternate syntax for line 3 that utilizes relationships built

    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new({
      user_id: current_user.id,
      quantity: params["quantity"],
      product_id: params["product_id"],
      status: "Carted",
    })

    @carted_product.save

    render "show.json.jb"
  end

  def destroy
    carted_product = current_user.carted_products.find_by(id: params["id"], status: "Carted")
    carted_product.status = "Removed"
    carted_product.save
    render json: { message: "Product removed from cart" }
  end
end
