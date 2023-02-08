class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :status, default: 'PENDING', null: false
      t.float :total_price, default: 0.0, null: false
      t.timestamps
    end
  end
end
