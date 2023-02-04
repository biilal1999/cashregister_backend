require 'rails_helper'

RSpec.describe 'Cart Products Controller UPDATE action', type: :request do
    describe 'PATCH cart product with failure' do
        it 'should fail because there is no product with ID 3 in the cart' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            patch "/carts/#{cart_id}/products/3", params: { "cart_product": { "quantity": 2 } }
            expect(response.status).to eq(404)
        end

        it 'should fail when executing the second call because zero quantity is not allowed' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            patch "/carts/#{cart_id}/products/1", params: { "cart_product": { "quantity": 0 } }
            expect(response.status).to eq(400)
        end
    end

    describe 'PATCH cart product successfully' do
        it 'should increase product quantity to 2' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            patch "/carts/#{cart_id}/products/1", params: { "cart_product": { "quantity": 2 } }
            expect(response.status).to eq(200)
            cart_product_response = JSON.parse(response.body)
            quantity = cart_product_response["cart"]["products"][0]["quantity"]
            expect(quantity).to eq(2)
        end
    end
end