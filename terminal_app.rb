require "http"

system "clear"

while true
  puts "Welcome to BookWyrm!"
  puts "Please choose from the following:"
  puts "[1] See all products"
  puts "[2] Search for a specific product"
  puts "[3] Update a specific product"
  puts "[4] Create a new product"
  puts "[5] Delete a product"
  puts "[q] Quit"
  choice = gets.chomp

  if choice == "1"
    response = HTTP.get("http://localhost:3000/api/products")
    books = response.parse
    # pp books
    books.map do |book|
      puts "ID: #{book[:id]}"
      puts "Title: #{book[:title]}"
      puts "Author: #{book[:author]}"
      puts "Image: #{book[:image_url]}"
      puts "Price: #{book[:price]}"
      puts "Description: #{book[:description]}"
      puts
    end
  elsif choice == "2"
    puts "Please enter ID of book to view"
    id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/products/#{id}")
    book = response.parse
    puts "ID: #{book[:id]}"
    puts "Title: #{book[:title]}"
    puts "Author: #{book[:author]}"
    puts "Image: #{book[:image_url]}"
    puts "Price: #{book[:price]}"
    puts "Description: #{book[:description]}"
    puts
  elsif choice == "3"
    puts "Please enter product ID to be updated"
    id = gets.chomp.to_i
    params = {}
    puts "Please enter new title (or return to skip)"
    params[:title] = gets.chomp
    puts "Please enter new author (or return to skip)"
    params[:author] = gets.chomp
    puts "Please enter new image URL (or return to skip)"
    params[:image_url] = gets.chomp
    puts "Please enter new price (or return to skip)"
    params[:price] = gets.chomp.to_i
    puts "Please enter new description (or return to skip)"
    params[:description] = gets.chomp

    params = params.delete_if { |_key, value| value.empty? }

    # response = HTTP.get("http://localhost:3000/api/products/#{id}")
    # book = response.parse
    # puts "Please enter attribute to update"
    # puts "[1] Title"
    # puts "[2] Author"
    # puts "[3] Image URL"
    # puts "[4] Description"
    # puts "[5] Price"
    # info = gets.chomp

    # if info == "1"
    #   puts "Please enter new title"
    #   title = gets.chomp
    # elsif info == "2"
    #   puts "Please enter new author"
    #   author = gets.chomp
    # elsif info == "3"
    #   puts "Please enter new image_url"
    #   image_url = gets.chomp
    # elsif info == "4"
    #   puts "Please enter new description"
    #   description = gets.chomp
    # elsif info == "5"
    #   puts "Please enter new price"
    #   price = gets.chomp.to_i
    # else
    #   puts "Invalid Option"
    # end

    response = HTTP.patch("http://localhost:3000/api/products/#{id}", :form => params)

    book = response.parse
    puts "Title: #{book["title"]}"
    puts "Author: #{book["author"]}"
    puts "Image: #{book["image_url"]}"
    puts "Price: #{book["price"]}"
    puts "Description: #{book["description"]}"
    puts
  elsif choice == "4"
    params = {}
    puts "Please enter new title"
    params[:title] = gets.chomp
    puts "Please enter new author"
    params[:author] = gets.chomp
    puts "Please enter new image URL"
    params[:image_url] = gets.chomp
    puts "Please enter new price"
    params[:price] = gets.chomp.to_i
    puts "Please enter new description"
    params[:description] = gets.chomp

    response = HTTP.post("http://localhost:3000/api/products", :form => params)
    book = response.parse
    puts "Title: #{book["title"]}"
    puts "Author: #{book["author"]}"
    puts "Image: #{book["image_url"]}"
    puts "Price: #{book["price"]}"
    puts "Description: #{book["description"]}"
    puts
  elsif choice == "5"
    puts "Please enter ID of product to be deleted"
    id = gets.chomp
    response = HTTP.delete("http://localhost:3000/products/#{id}")
    # puts "Product deleted!"
    data = response.parse
    p data[:message]
  elsif choice.downcase == "q"
    break
  else
    puts "Invalid option"
  end
end
