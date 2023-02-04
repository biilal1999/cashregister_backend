class CartsController < ApplicationController
    before_action -> { product }, only: %i[create]

    def index
        @carts = Cart.all
    end

    def create
        @cart = Cart.new
        @cart.products << @product
        @cart.save ? @cart : bad_request(@cart)
    end

    private

    def product
        @product = Product.find_by_id(params[:cart][:product_id])
        not_found_resource unless @product
    end
end