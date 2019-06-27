Rails.application.routes.draw do

  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#display_all"
    # get "/hobbit" => "products#display_hobbit"
    # get "/cider" => "products#display_cider"
    # get "/jim" => "products#display_jim"
    # get "/nations" => "products#display_nations"
    # get "/first" => "products#display_first"
    get "/one_product" => "products#display_product_query"
    get "/one_product/:id" => "products#display_product_query"
  end
end
2
