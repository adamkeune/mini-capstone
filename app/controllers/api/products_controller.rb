class Api::ProductsController < ApplicationController
  def display_all
    @products = Product.all
    render "display_all.json.jb"
  end

  def display_hobbit
    @product = Product.find_by(title: "The Hobbit")
    render "display_one.json.jb"
  end

  def display_cider
    @product = Product.find_by(title: "The Cider House Rules")
    render "display_one.json.jb"
  end

  def display_jim
    @product = Product.find_by(title: "The New Jim Crow")
    render "display_one.json.jb"
  end

  def display_nations
    @product = Product.find_by(title: "American Nations: A History of the Eleven Rival Regional Cultures of North America")
    render "display_one.json.jb"
  end

  def display_first
    @product = Product.first
    render "display_one.json.jb"
  end
end
