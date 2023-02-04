class CartProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :cart_id, uniqueness: { scope: :product_id, message: "The current cart has already this product" }
end