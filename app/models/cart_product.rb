class CartProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :cart_id, uniqueness: { scope: :product_id, message: "The current cart has already this product" }

    after_destroy :check_empty_cart

    def product_code
        product&.product_code
    end

    def product_price
        product&.price
    end

    def check_empty_cart
        cart_product = CartProduct.where(cart_id: self.cart_id).first
        Cart.find_by_id(self.cart_id)&.destroy if cart_product.blank?
    end
end