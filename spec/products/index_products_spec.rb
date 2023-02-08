require 'rails_helper'

RSpec.describe 'Products Controller', type: :request do
    describe 'GET products' do
        it 'should have three products' do
            get "/products"
            products = JSON.parse(response.body)
            expect(products["products"].count).to eq(3)
        end
    end
end