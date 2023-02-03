# frozen_string_literal: true

class Product < ApplicationRecord
  validates :product_code, :name, :price, presence: true
  validates :product_code, :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
