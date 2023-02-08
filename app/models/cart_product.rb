class CartProduct < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :cart_id, uniqueness: { scope: :product_id, message: "The current cart has already this product" }

    after_update :check_quantity_zero
    after_destroy :check_empty_cart
    after_commit :calculate_total_price

    def product_code
        product&.product_code
    end

    def product_price
        product&.price
    end

    private

    def check_quantity_zero
        self.destroy if self.quantity.zero?
    end

    def check_empty_cart
        cart_product = CartProduct.where(cart_id: self.cart_id).first
        cart&.update(status: 'CANCELED') if cart_product.blank?
    end

    def calculate_total_price
        @total_price = 0
        items = cart&.cart_products
        return if items.blank?
        items.each { |item| @total_price += item.quantity * item.product_price }
        apply_discount_logic(items)
        cart.update(total_price: @total_price.round(2))
    end

    def apply_discount_logic(items)
        { "tea": "GR1", "strawberry": "SR1", "coffee": "CF1" }.each do |name, code|
            item = items.find { |it| it.product_code == code }
            send("#{name}_discount", item) if item
        end
    end

    def tea_discount(item)
        aux = item.quantity % 2 == 0 ? 0 : 1
        @total_price -= (item.quantity - aux) / 2 * item.product_price
    end

    def strawberry_discount(item)
        @total_price -= item.quantity * 0.5 if item.quantity >= 3
    end

    def coffee_discount(item)
        @total_price -= item.product_price / 3 * item.quantity if item.quantity >= 3
    end
end