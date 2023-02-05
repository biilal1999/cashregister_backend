require 'rails_helper'

RSpec.describe 'Test Data for discount logic', type: :request do
    describe 'Tea discount' do
        it 'should cost 3.11€' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            patch "/carts/#{cart_id}/products/1", params: { "cart_product": { "quantity": 2 } }
            cart_product_response = JSON.parse(response.body)
            price = cart_product_response["cart"]["total_price"]
            expect(price).to eq(3.11)
        end
    end

    describe 'Strawberry discount' do
        it 'should cost 16.61€' do
            post "/carts", params: { "cart": { "product_id": 2 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            patch "/carts/#{cart_id}/products/2", params: { "cart_product": { "quantity": 2 } }
            post "/carts/#{cart_id}/products", params: { "cart_product": { "product_id": 1 } }
            patch "/carts/#{cart_id}/products/2", params: { "cart_product": { "quantity": 3 } }
            cart_product_response = JSON.parse(response.body)
            price = cart_product_response["cart"]["total_price"]
            expect(price).to eq(16.61)
        end
    end

    describe 'Coffee discount' do
        it 'should cost 30.57€' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            cart_response = JSON.parse(response.body)
            cart_id = cart_response["cart"]["id"]
            post "/carts/#{cart_id}/products", params: { "cart_product": { "product_id": 3 } }
            post "/carts/#{cart_id}/products", params: { "cart_product": { "product_id": 2 } }
            patch "/carts/#{cart_id}/products/3", params: { "cart_product": { "quantity": 2 } }
            patch "/carts/#{cart_id}/products/3", params: { "cart_product": { "quantity": 3 } }
            cart_product_response = JSON.parse(response.body)
            price = cart_product_response["cart"]["total_price"]
            expect(price).to eq(30.57)
        end
    end
end