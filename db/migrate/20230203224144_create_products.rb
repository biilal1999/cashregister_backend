# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_code, null: false
      t.string :name, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end
