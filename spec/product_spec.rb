require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    product = Product.new(
      name: 'new item',
      price: 100,
      quantity: 10,
      category: Category.new
    )

    it 'should have a name' do
      expect(product.name)
    end

    it 'should have a price' do
      expect(product.price)
    end

    it 'should have a quantity' do
      expect(product.quantity)
    end

    it 'should have a category' do
      expect(product.category)
    end

  end
end