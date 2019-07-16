class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted")

    order_subtotal = 0
    order_tax = 0

    carted_products.each do |p|
      product_price = p.product.price
      order_subtotal += (product_price * p.quantity.to_i)
      order_tax += (p.product.tax * p.quantity.to_i)
    end

    order_total = order_subtotal + order_tax

    @order = Order.new({
      user_id: current_user.id,
      carted_products: carted_products,
      subtotal: order_subtotal,
      tax: order_tax,
      total: order_total,
    })

    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }
    end

    carted_products.update_all(status: "Purchased", order_id: @order.id) # Rails method available for following block:
    # carted_products.each do |carted_product|
    #   carted_product.status = "Purchased"
    #   carted_product.order_id = @order.id
    #   carted_product.save # DON'T FORGET TO SAVE!!!
    # end
  end

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    render "show.json.jb"
  end
end
