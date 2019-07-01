class AddIsbnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :isbn, :string
  end
end
