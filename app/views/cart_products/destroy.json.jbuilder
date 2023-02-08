json.cart do
    json.partial! 'carts/cart', cart: @cart if @cart
end