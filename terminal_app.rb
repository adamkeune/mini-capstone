require "http"

system "clear"

while true
  puts "Welcome to BookWyrm!"
  puts "Please choose from the following:"
  puts "[1] See all products"
  puts "[2] Search for a specific product"
  puts "[3] Update a specific product"
  puts "[q] Quit"
  choice = gets.chomp

  if choice == "1"
    response = HTTP.get("http://localhost:3000/api/products")
    books = response.parse
    books.map do |book|
      puts "Title: #{book["title"]}"
      puts "Author: #{book["author"]}"
      puts "Price: #{book["price"]}"
      puts "Description: #{book["description"]}"
      puts
    end
  elsif choice == "2"
    puts "Please enter ID of book to view"
    id = gets.chomp
    response = HTTP.get("http://localhost:3000/api/products/#{id}")
    book = response.parse
    puts "Title: #{book["title"]}"
    puts "Author: #{book["author"]}"
    puts "Price: #{book["price"]}"
    puts "Description: #{book["description"]}"
    puts
  elsif choice == "3"
    puts "Please enter product ID to be updated"
    id = gets.chomp.to_i
    response = HTTP.get("http://localhost:3000/api/products/#{id}")
    book = response.parse
    puts "Please enter new title (or return to skip)"
    title = gets.chomp
    p title
    puts "Please enter new author (or return to skip)"
    author = gets.chomp
    puts "Please enter new image_url (or return to skip)"
    image_url = gets.chomp
    puts "Please enter new description (or return to skip)"
    description = gets.chomp
    puts "Please enter new price (or return to skip)"
    price = gets.chomp
    puts
    response = HTTP.patch("http://localhost:3000/api/products/#{id}", :form => {
                                                                        title: title,
                                                                        author: author,
                                                                        image_url: image_url,
                                                                        description: description,
                                                                        price: price,
                                                                      })
    book = response.parse
    pp book
  elsif choice.downcase == "q"
    break
  else
    puts "Invalid option"
  end
end
