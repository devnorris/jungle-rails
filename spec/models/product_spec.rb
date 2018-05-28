require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'is valid if it has a name, price, quantity and category' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create(
        name: "Sweater",
        price: 160.00,
        quantity: 20
      )
      product.valid?
    end

    it 'is not valid without a name' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
        product = cat1.products.create(
          name: nil,
          price: 160.00,
          quantity: 20
      )
      expect(product.errors).to have_key(:name)
      puts product.errors.full_messages
    end

    it 'is not valid without a price' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
        product = cat1.products.create(
          name: "Sweater",
          price: nil,
          quantity: 20
        )
      expect(product.errors).to have_key(:price)
      puts product.errors.full_messages
    end

    it 'is not valid without any quantity' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
        product = cat1.products.create(
          name: "Sweater",
          price: 160.00,
          quantity: nil
        )
      expect(product.errors).to have_key(:quantity)
      puts product.errors.full_messages
    end

    it 'is not valid without a catergory' do
      product = Product.create(
        name: "Sweater",
        price: 160.00,
        quantity: 20
      )
      expect(product.errors).to have_key(:category)
      puts product.errors.full_messages
    end

  end
end
