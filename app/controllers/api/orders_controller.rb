class Api::OrdersController < ApplicationController
  def create
    if current_user
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
    else
      render json: {}, status: :unauthorized
    end
  end

  def index
    if current_user
      @orders = current_user.orders
      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def show
    if current_user
      @order = current_user.orders.find_by(id: params["id"])
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
end
