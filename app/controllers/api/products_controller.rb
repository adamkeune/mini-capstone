class Api::ProductsController < ApplicationController
  def display_all
    @products = Product.all
    render "display_all.json.jb"
  end
end
