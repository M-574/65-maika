class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.text :detail
      t.string :view

      t.timestamps
    end
  end
end
