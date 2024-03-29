class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
