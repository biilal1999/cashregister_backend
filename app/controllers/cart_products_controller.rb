class CartProductsController < ApplicationController
    before_action -> { cart }, only: %i[create]
    before_action -> { product }, only: %i[create]

    def create
        cart_product = CartProduct.new(cart_id: @cart_id, product_id: @product.id)
        return bad_request(cart_product) unless cart_product.save
        @carts = Cart.all
    end

    private

    def cart
        cart_product = CartProduct.where(cart_id: params[:cart_id]).first
        cart_product ? @cart_id = cart_product&.cart_id : not_found_resource
    end

    def product
        @product = Product.find_by_id(params[:cart_product][:product_id])
        not_found_resource unless @product
    end
end