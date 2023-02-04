json.carts do
    json.array! @carts do |cart|
        json.partial! 'carts/cart', cart: cart
    end
end