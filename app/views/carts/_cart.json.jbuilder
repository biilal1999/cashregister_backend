json.id cart.id
json.status cart.status
json.products do
    json.array! cart.cart_products do |cart_prod|
        json.partial! 'cart_products/cart_product', cart_product: cart_prod
    end
end
json.total_price cart.total_price