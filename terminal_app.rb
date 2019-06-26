require "http"

system "clear"

while true
  puts "Welcome to BookWyrm!"
  puts "Please choose from the following:"
  puts "[1] See all products"
  puts "[2] Search for a specific product"
  puts "[q] Quit"
  choice = gets.chomp

  if choice == "1"
    response = HTTP.get("http://localhost:3000/api/all_products")
    books = response.parse
    books.map do |book|
      puts "Title: #{book["title"]}"
      puts "Author: #{book["author"]}"
      puts "Price: #{book["price"]}"
      puts "Description: #{book["description"]}"
      puts
    end
  elsif choice == "2"
    response = HTTP.get("http://localhost:3000/api/all_products")
    books = response.parse
    puts "How would you like to search?"
    puts "[1] By Author"
    puts "[2] By Title"
    search = gets.chomp
    if search == "1"
      puts "Please enter author"
      author = gets.chomp
      books.each do |book|
        if book["author"] == author
          puts "Title: #{book["title"]}"
          puts "Author: #{book["author"]}"
          puts "Price: #{book["price"]}"
          puts "Description: #{book["description"]}"
          puts
        end
      end
    elsif search == "2"
      puts "Please enter title"
      title = gets.chomp
      books.each do |book|
        if book["title"] == title
          puts "Title: #{book["title"]}"
          puts "Author: #{book["author"]}"
          puts "Price: #{book["price"]}"
          puts "Description: #{book["description"]}"
          puts
        end
      end
    else
      puts "Invalid option"
    end
  elsif choice.downcase == "q"
    break
  else
    puts "Invalid option"
  end
end
