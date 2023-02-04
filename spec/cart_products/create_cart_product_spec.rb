require 'rails_helper'

RSpec.describe 'Cart Products Controller CREATE action', type: :request do
    describe 'POST cart product with failure' do
        it 'should fail because there is no cart yet' do
            post "/carts/5/products", params: { "cart_product": { "product_id": 1 } }
            expect(response.status).to eq(404)
        end

        it 'should fail when executing the second call because this product already exists in this cart' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            post "/carts/#{cart_id}/products", params: { "cart_product": { "product_id": 1 } }
            expect(response.status).to eq(400)
        end
    end

    describe 'POST cart product successfully' do
        it 'should return a cart with 2 products successfully' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            post "/carts/#{cart_id}/products", params: { "cart_product": { "product_id": 2 } }
            expect(response.status).to eq(200)
        end
    end
end