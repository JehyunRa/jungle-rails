require 'rails_helper'

RSpec.feature "Visitor navigates to product detail", type: :feature, js: true do

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
    # page.find('.title', match: :first).click

    within('.product', match: :first) do
      within('header') do
        click_link 'a'
        puts find('.title').text
      end
    end

    expect(page).to have_css '.products-show'

    # click_link('#test')

    # click_link 'About'
    # click_on 'About'
    # visit '/about'

    # DEBUG
    save_screenshot

    # VERIFY
    # expect(page).to have_css 'products-show'
  end
end