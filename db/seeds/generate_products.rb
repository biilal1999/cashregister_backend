# frozen_string_literal: true

Product.where(product_code: 'GR1', name: 'Green Tea', price: 3.11).first_or_create!
Product.where(product_code: 'SR1', name: 'Strawberries', price: 5).first_or_create!
Product.where(product_code: 'CF1', name: 'Coffee', price: 11.23).first_or_create!
