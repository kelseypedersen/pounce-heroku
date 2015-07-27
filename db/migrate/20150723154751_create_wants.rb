class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.references :user
      t.references :product
      t.float :max_price
      t.date :expiration
      t.boolean :notified, default: false
      t.boolean :fulfilled, default: false

      t.timestamps null: false
    end
  end
end
