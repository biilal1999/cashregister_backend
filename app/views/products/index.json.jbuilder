#json.partial! 'products/product', collection: @products, as: :product

json.products do
    json.array! @products do |product|
        json.partial! 'products/product', product: product
    end
end