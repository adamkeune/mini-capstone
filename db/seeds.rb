# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Supplier.create!({ name: "Amazon", email: "amazon@email.com", phone_number: "1-800-555-5555" })
Supplier.create!({ name: "Wal-Mart", email: "wallyworld@email.com", phone_number: "888-666-HELL" })

Product.create!({ title: "The Hobbit", author: "J.R.R. Tolkien", price: 15, image_url: "http://2.bp.blogspot.com/-CaKmzMXmD4I/UJ0Y3_HernI/AAAAAAAAN0E/Y3M_HKLCXYA/s1600/hobbit_book_cover_02.jpg", description: "A tale of adventure for a half-sized hero" })
Product.create!({ title: "The Cider House Rules", author: "John Irving", price: 18, image_url: "https://images.bwbcovers.com/034/The-Cider-House-Rules-9780345387653.jpg", description: "Orphan Homer Wells finds goes to live at an apple orchard" })
Product.create!({ title: "The New Jim Crow", author: "Michelle Alexander", price: 22, image_url: "http://en.wikipedia.org/wiki/Special:FilePath/The_New_Jim_Crow_cover.jpg", description: "America's criminal justice system creates a permanent underclass of minorities" })
Product.create!({ title: "American Nations: A History of the Eleven Rival Regional Cultures of North America", author: "Colin Woodard", price: 12, image_url: "http://4.bp.blogspot.com/-nwZf0jkuZls/T_laM-p-8TI/AAAAAAAA5Ms/hW2OAl7-N9U/s1600/American+Nations+cover.JPG", description: "'American culture' is more complex than you think" })
