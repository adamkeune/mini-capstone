class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @order = Order.new({
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
    })

    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }
    end
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
