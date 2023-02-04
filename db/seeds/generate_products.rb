# frozen_string_literal: true

Product.where(product_code: 'GR1', name: 'Green Tea').first_or_create!
Product.where(product_code: 'SR1', name: 'Strawberries').first_or_create!
Product.where(product_code: 'CF1', name: 'Coffee').first_or_create!
