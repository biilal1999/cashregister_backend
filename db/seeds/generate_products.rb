# frozen_string_literal: true

product = Product.where(product_code: 'GR1', name: 'Green Tea').first
Product.create(product_code: 'GR1', name: 'Green Tea', price: 3.11) unless product

product = Product.where(product_code: 'SR1', name: 'Strawberries').first
Product.create(product_code: 'SR1', name: 'Strawberries', price: 5) unless product

product = Product.where(product_code: 'CF1', name: 'Coffee').first
Product.create(product_code: 'CF1', name: 'Coffee', price: 11.23) unless product