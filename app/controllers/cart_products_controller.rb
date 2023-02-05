class CartProductsController < ApplicationController
    before_action -> { cart }, only: %i[create]
    before_action -> { product }, only: %i[create]
    before_action -> { cart_product }, except: %i[create]

    def create
        cart_product = CartProduct.new(cart_id: @cart&.id, product_id: @product.id)
        bad_request(cart_product) unless cart_product.save
        @cart = cart_product.cart
    end

    def update
        bad_request(@cart_product) unless @cart_product.update(cart_product_params)
        @cart = @cart_product.cart
    end

    def destroy
        @cart_product.destroy
        @cart = @cart_product.cart
    end

    private

    def cart
        cart_product = CartProduct.where(cart_id: params[:cart_id]).first
        cart_product ? @cart = cart_product&.cart : not_found_resource
    end

    def product
        @product = Product.find_by_id(params[:cart_product][:product_id])
        not_found_resource unless @product
    end

    def cart_product
        @cart_product = CartProduct.where(cart_id: params[:cart_id], product_id: params[:id]).first
        not_found_resource unless @cart_product
    end

    def cart_product_params
        params.require(:cart_product).permit(:quantity)
    end
end