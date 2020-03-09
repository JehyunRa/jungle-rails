require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    product = Product.new(
      name: 'new item',
      price: 100,
      quantity: 10,
      category: Category.new
    )

    it 'should save when all fields are valid' do
      expect(product).to be_valid
    end

    it 'should have a name' do
      @product = product
      @product.name = nil
      expect(@product).to be_invalid
    end

    it 'should have a price' do
      @product = product
      @product.price = nil
      expect(@product).to be_invalid
    end

    it 'should have a quantity' do
      @product = product
      @product.quantity = nil
      expect(@product).to be_invalid
    end

    it 'should have a category' do
      @product = product
      @product.category = nil
      expect(@product).to be_invalid
    end

  end
end