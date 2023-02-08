require 'rails_helper'

RSpec.describe 'Carts Controller CREATE action', type: :request do
    describe 'POST cart' do
        it 'should return an array with one cart' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            expect(response.status).to eq(200)
        end

        it 'should fail when executing the second call because pending cart already exists' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            post "/carts", params: { "cart": { "product_id": 2 } }
            expect(response.status).to eq(400)
        end
    end

    describe 'POST cart with unexisting product' do
        it 'should not find the product' do
            post "/carts", params: { "cart": { "product_id": 5 } }
            expect(response.status).to eq(404)
        end
    end
end