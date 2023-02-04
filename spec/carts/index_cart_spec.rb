require 'rails_helper'

RSpec.describe 'Carts Controller INDEX action', type: :request do
    describe 'GET carts' do
        it 'should create a cart with one product' do
            post "/carts", params: { "cart": { "product_id": 1 } }
            get "/carts"
            carts = JSON.parse(response.body)
            expect(carts["carts"].count).to eq(1)
        end
    end
end