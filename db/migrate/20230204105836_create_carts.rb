class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :status, null: false
      t.float :total_price, default: 0.0, null: false
      t.timestamps
    end
  end
end
