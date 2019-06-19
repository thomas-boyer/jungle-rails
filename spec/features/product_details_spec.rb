require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do

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

  scenario "Users can navigate to product detail page" do

    visit root_path

    all('.btn-primary')[0].click

    sleep(5.seconds)
    expect(page).to have_content('Add Details')

  end

end
