# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Supplier.create!({ name: "Amazon", email: "amazon@email.com", phone_number: "1-800-555-5555" })
Supplier.create!({ name: "Wal-Mart", email: "wallyworld@email.com", phone_number: "888-666-HELL" })

Product.create!({ title: "The Hobbit", author: "J.R.R. Tolkien", price: 15, description: "A tale of adventure for a half-sized hero", isbn: "978-0547928227" })
Product.create!({ title: "The Cider House Rules", author: "John Irving", price: 18, description: "Orphan Homer Wells finds goes to live at an apple orchard", isbn: "978-0345387653" })
Product.create!({ title: "The New Jim Crow", author: "Michelle Alexander", price: 22, description: "America's criminal justice system creates a permanent underclass of minorities", isbn: "978-1595586438" })
Product.create!({ title: "American Nations: A History of the Eleven Rival Regional Cultures of North America", author: "Colin Woodard", price: 12, description: "'American culture' is more complex than you think", isbn: "978-0143122029" })

Image.create!({ url: "http://2.bp.blogspot.com/-CaKmzMXmD4I/UJ0Y3_HernI/AAAAAAAAN0E/Y3M_HKLCXYA/s1600/hobbit_book_cover_02.jpg", product_id: 1 })

Image.create!({ url: "https://images.bwbcovers.com/034/The-Cider-House-Rules-9780345387653.jpg", product_id: 2 })

Image.create!({ url: "http://en.wikipedia.org/wiki/Special:FilePath/The_New_Jim_Crow_cover.jpg", product_id: 3 })

Image.create!({ url: "http://4.bp.blogspot.com/-nwZf0jkuZls/T_laM-p-8TI/AAAAAAAA5Ms/hW2OAl7-N9U/s1600/American+Nations+cover.JPG", product_id: 4 })

Image.create!({ url: "https://tse1.mm.bing.net/th?id=OIP.JbR5J2xZ_isNJlu2v6NqogHaLH&pid=Api&rs=1&c=1&qlt=95&w=79&h=119", product_id: 1 })

Image.create!({ url: "https://tse1.mm.bing.net/th?id=OIP.Rbkad-M5KOTi5FKwXRED9AHaJl&pid=Api&rs=1&c=1&qlt=95&w=92&h=119", product_id: 1 })
