class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :shopstyle_id
      t.string :title
      t.string :description
      t.float :current_price
      t.float :lowest_price

      t.timestamps null: false
    end
  end
end
