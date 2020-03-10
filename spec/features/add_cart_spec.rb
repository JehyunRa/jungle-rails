require 'rails_helper'

RSpec.feature "Visitor clicks add to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can see My Cart increase count" do
    # ACT
    visit root_path

    within('.product', match: :first) do
      within('footer') do
        find('.btn-primary').click
      end
    end

    # VERIFY
    within('.navbar') do
      @cart = find(:xpath, "//a[@href='/cart']")
      expect(@cart).to have_text 'My Cart (1)'
    end

    # DEBUG
    save_screenshot
  end
end