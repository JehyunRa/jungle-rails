require 'rails_helper'

RSpec.feature "Visitor clicks product link", type: :feature, js: true do

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

  scenario "They can access product detail" do
    # ACT
    visit root_path

    within('.product', match: :first) do
      within('header') do
        click_link 'a'
        puts find('.title').text
      end
    end

    # VERIFY
    expect(page).to have_css '.products-show'

    # DEBUG
    save_screenshot
  end
end