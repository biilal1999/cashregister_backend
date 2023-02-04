class Cart < ApplicationRecord
    default_scope { where(status: 'PENDING') }

    has_many :cart_products
    has_many :products, through: :cart_products

    validates :status, presence: true, inclusion: { in: %w(PENDING CANCELED), message: "%{value} is not a valid status" }
    validate :one_active_cart

    private

    def one_active_cart
        active_carts = Cart.all
        errors.add(:status, message: "Only one cart is allowed at the same time") if !active_carts.blank? && status == "PENDING"
    end
end