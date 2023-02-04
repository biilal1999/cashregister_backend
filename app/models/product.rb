# frozen_string_literal: true

class Product < ApplicationRecord
    has_many :cart_products
    has_many :carts, through: :cart_products
  
    validates :product_code, :name, :price, presence: true
    validates :product_code, :name, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
end
