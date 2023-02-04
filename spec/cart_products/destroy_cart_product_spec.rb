require 'rails_helper'

RSpec.describe 'Cart Products Controller DESTROY action', type: :request do
    describe 'DELETE cart product with failure' do
        it 'should fail because there is no product with ID 3 in the cart' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            delete "/carts/#{cart_id}/products/3"
            expect(response.status).to eq(404)
        end
    end

    describe 'DELETE cart product successfully' do
        it 'should remove the product from the cart' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            delete "/carts/#{cart_id}/products/1"
            expect(response.status).to eq(200)
            cart_product_response = JSON.parse(response.body)
            cart_products = cart_product_response["cart"]["products"]
            expect(cart_products.count).to eq(0)
        end
    end
end