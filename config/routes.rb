Rails.application.routes.draw do

  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#display_all"
    get "/hobbit" => "products#display_hobbit"
    get "/cider" => "products#display_cider"
    get "/jim" => "products#display_jim"
    get "/nations" => "products#display_nations"
    get "/first" => "products#display_first"
  end
end
2
